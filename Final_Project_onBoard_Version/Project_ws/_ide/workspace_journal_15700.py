# 2026-01-07T13:15:30.334734200
import vitis

client = vitis.create_client()
client.set_workspace(path="F:/Project_ws")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

