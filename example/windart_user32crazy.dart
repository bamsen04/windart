// windart_user32crazy.dart
//
// Crazy demo of User32 APIs without windows.
// Uses AllocConsole + WriteConsoleW for output.

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

// Console writer helper
void writeConsole(int hConsole, String text) {
  final ptr = text.toNativeUtf16();
  final written = calloc<ffi.Uint32>();
  Kernel32.writeConsoleW(hConsole, ptr, text.length, written, ffi.nullptr);
  calloc.free(ptr);
  calloc.free(written);
}

void main() {
  // --- 0. Setup console ---
  Kernel32.allocConsole();
  final hConsole = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  // --- 1. Show a MessageBox ---
  final text = "Welcome to User32 crazy demo!".toNativeUtf16();
  final caption = "User32 Fun".toNativeUtf16();
  User32.messageBoxW(0, text, caption, 0);
  calloc.free(text);
  calloc.free(caption);

  // --- 2. Check if ESC is pressed (GetAsyncKeyState) ---
  writeConsole(hConsole, "Hold ESC now to see detection...\n");
  Kernel32.sleep(3000); // wait 3 sec
  final state = User32.getAsyncKeyState(VK_ESCAPE); // ESCAPE
  if (state != 0) {
    writeConsole(hConsole, "✅ ESC was pressed!\n");
  } else {
    writeConsole(hConsole, "❌ ESC not pressed.\n");
  }

  // --- 3. Get and set cursor position ---
  final point = calloc<Point>();
  if (User32.getCursorPos(point) != 0) {
    writeConsole(hConsole, "Cursor at: (${point.ref.x}, ${point.ref.y})\n");
    User32.setCursorPos(point.ref.x + 50, point.ref.y + 50);
    writeConsole(hConsole, "Cursor moved by +50,+50!\n");
  }
  calloc.free(point);

  // --- 4. Get screen resolution ---
  final screenW = User32.getSystemMetrics(0); // SM_CXSCREEN
  final screenH = User32.getSystemMetrics(1); // SM_CYSCREEN
  writeConsole(hConsole, "Screen size: ${screenW}x${screenH}\n");
}
