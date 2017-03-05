defmodule KV.RegistryTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, registry} = KV.Registry.start_link
    {:ok, registry: registry}
  end

  test "spawn buckets", %{registry: registry} do
    assert KV.Registry.lookup(registry, "one") == :error

    KV.Registry.create(registry, "one")

    assert {:ok, bucket} = KV.Registry.lookup(registry, "one")

    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1

    assert KV.Registry.create(registry, "one") == :ok

  end

  test "correctly stops", %{registry: registry} do
    assert KV.Registry.stop(registry) == :ok
  end

  test "removes buckets on exit", %{registry: registry} do
    KV.Registry.create(registry, "shopping")
    {:ok, bucket} = KV.Registry.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert KV.Registry.lookup(registry, "shopping") == :error
  end

end
