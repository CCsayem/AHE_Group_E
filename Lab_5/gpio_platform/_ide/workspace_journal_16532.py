# 2026-01-07T14:15:29.986415200
import vitis

client = vitis.create_client()
client.set_workspace(path="gpio_platform")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "platform",hw_design = "$COMPONENT_LOCATION/../../tmp3_gpio_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

platform = client.get_component(name="platform")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../../tmp3_gpio_wrapper.xsa")

status = platform.build()

comp = client.create_app_component(name="tmp3_onGPIO",platform = "$COMPONENT_LOCATION/../platform/export/platform/platform.xpfm",domain = "standalone_microblaze_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="tmp3_onGPIO")
comp.build()

status = platform.build()

comp.build()

vitis.dispose()

