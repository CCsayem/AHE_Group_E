# 2026-01-08T16:01:25.327735400
import vitis

client = vitis.create_client()
client.set_workspace(path="gpio_platform")

vitis.dispose()

