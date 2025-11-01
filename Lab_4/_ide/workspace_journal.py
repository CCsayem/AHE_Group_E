# 2025-10-30T14:55:00.801800500
import vitis

client = vitis.create_client()
client.set_workspace(path="F:/AHE_Final_Labs")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "hello_demo",hw_design = "F:\Design_MicroBlaze_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="hello_demo")
status = platform.build()

comp = client.create_app_component(name="Hello_World",platform = "$COMPONENT_LOCATION/../hello_demo/export/hello_demo/hello_demo.xpfm",domain = "standalone_microblaze_0")

status = platform.build()

comp = client.get_component(name="Hello_World")
comp.build()

status = platform.build()

comp.build()

status = platform.build()

comp.build()

comp = client.create_app_component(name="hello_world_ruhul",platform = "$COMPONENT_LOCATION/../hello_demo/export/hello_demo/hello_demo.xpfm",domain = "standalone_microblaze_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_world_ruhul")
comp.build()

vitis.dispose()

vitis.dispose()

