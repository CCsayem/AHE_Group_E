# 2026-01-05T13:10:37.313748400
import vitis

client = vitis.create_client()
client.set_workspace(path="F:/esp32_sw2")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

