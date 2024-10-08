from ignis.widgets import Widget
from .qs_button import QSButton
from ignis.services.bluetooth import BluetoothService

bluetooth = BluetoothService.get_default()

class BluetoothDeviceItem(Widget.Button):
    def __init__(self):
        super().__init__(
            css_classes=["bluetooth-device-item", "unset"],
            child=Widget.Box(
                child=[
                    Widget.Label(
                        label=BluetoothService.list_adapters,
                        ellipsize="end",
                        max_width_chars=20,
                        halign="start",
                        css_classes=["bluetooth-device-label"],
                    ),
                ]
            ),
        )

def bluetooth_control() -> QSButton:
    devices_list = Widget.Revealer(
        transition_duration=300,
        transition_type="slide_down",
        child=Widget.Box(
            vertical=True,
            css_classes=["bluetooth-device-list"],
            on_click = print(BluetoothService.list_adapters),
            child=[
                Widget.Box(
                    css_classes=["bluetooth-header-box"],
                    child=[
                        Widget.Icon(icon_name="bluetooth-symbolic", pixel_size=28),
                        Widget.Label(
                            label="Bluetooth devices",
                            css_classes=["bluetooth-header-label"],
                        ),
                    ],
                ),
                Widget.Box(
                    vertical=True,

                ),
                Widget.Separator(css_classes=["bluetooth-device-list-separator"]),
                Widget.Button(
                    css_classes=["bluetooth-device-item", "unset"],
                    style="margin-bottom: 0;",
                    child=Widget.Box(
                        child=[
                            Widget.Icon(image="preferences-system-symbolic"),
                            Widget.Label(
                                label="Bluetooth Settings",
                                halign="start",
                                css_classes=["bluetooth-device-label"],
                            ),
                        ]
                    ),
                ),
            ],
        ),
    )

    return QSButton(
        label="Bluetooth",
        icon_name="bluetooth-symbolic",
        content=devices_list,
    )
