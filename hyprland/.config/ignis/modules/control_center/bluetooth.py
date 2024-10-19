from ignis.widgets import Widget
from .qs_button import QSButton
from ignis.services.bluetooth import BluetoothService


bluetooth = BluetoothService.get_default()

def bluetooth_control() -> QSButton:
    pass
