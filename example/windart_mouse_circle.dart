// mouse_circle.dart
//
// Moves the mouse cursor in a circle until ESC is pressed.
// Uses AllocConsole + WriteConsoleW for logging.

import 'dart:ffi' as ffi;
import 'dart:math';
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void writeConsole(int hConsole, String text) {
  final ptr = text.toNativeUtf16();
  final written = calloc<ffi.Uint32>();
  Kernel32.writeConsoleW(hConsole, ptr, text.length, written, ffi.nullptr);
  calloc.free(ptr);
  calloc.free(written);
}

void main() {
  // Setup console
  Kernel32.allocConsole();
  final hConsole = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  // Get screen size
  final screenW = User32.getSystemMetrics(SM_CXSCREEN);
  final screenH = User32.getSystemMetrics(SM_CYSCREEN);

  // Circle center = middle of screen
  final centerX = screenW ~/ 2;
  final centerY = screenH ~/ 2;

  // Radius (quarter of screen height)
  final radius = min(screenW, screenH) ~/ 4;

  writeConsole(
      hConsole,
      "Moving mouse in circle at center ($centerX,$centerY), radius=$radius\n"
      "Press ESC to exit...\n");

  double angle = 0;
  while (true) {
    // exit check
    if (User32.getAsyncKeyState(VK_ESCAPE) != 0) {
      writeConsole(hConsole, "ESC pressed, exiting...\n");
      break;
    }

    final x = centerX + (radius * cos(angle)).toInt();
    final y = centerY + (radius * sin(angle)).toInt();

    User32.setCursorPos(x, y);

    angle += 0.05; // step in radians
    if (angle > 2 * pi) angle -= 2 * pi;

    Kernel32.sleep(10); // smooth movement
  }
}
