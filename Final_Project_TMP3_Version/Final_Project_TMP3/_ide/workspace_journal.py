# 2026-01-08T16:44:38.312503400
import vitis

client = vitis.create_client()
client.set_workspace(path="F:/Final_Project_TMP3")

platform = client.get_component(name="platform")
status = platform.build()

comp = client.get_component(name="app_component")
comp.build()

