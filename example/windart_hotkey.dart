import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void main() {
  print("Listening for CTRL+M+P...");

  while (true) {
    final ctrl = User32.getAsyncKeyState(VK_CONTROL) & 0x8000 != 0;
    final m = User32.getAsyncKeyState(VK_M) & 0x8000 != 0;
    final p = User32.getAsyncKeyState(VK_P) & 0x8000 != 0;

    if (ctrl && m && p) {
      final text = "CTRL + M + P pressed!".toNativeUtf16();
      final caption = "Hotkey".toNativeUtf16();
      User32.messageBoxW(0, text, caption, MB_OK);
      calloc.free(text);
      calloc.free(caption);

      // simple debounce so it doesn’t spam
      Kernel32.sleep(500);
    }
  }
}
