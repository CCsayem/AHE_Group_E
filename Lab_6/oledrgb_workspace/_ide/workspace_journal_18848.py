# 2025-12-30T12:17:32.176851900
import vitis

client = vitis.create_client()
client.set_workspace(path="F:/oledrgb_workspace")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

status = platform.build()

comp.build()

status = comp.clean()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

status = comp.clean()

comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

status = comp.clean()

vitis.dispose()

vitis.dispose()

