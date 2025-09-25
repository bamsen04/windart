// windart_readwritefile.dart
//
// Create a file called test.txt, write some text into it,
// then read it back and print to the console using WinDart.

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void main() {
  // Open a console window
  Kernel32.allocConsole();
  final hConsole = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  // Path for the test file (relative = current working directory)
  final filePath = "test.txt".toNativeUtf16();

  // --- 1. Create and write to file ---
    final hFileWrite = Kernel32.createFileW(
      filePath,
      GENERIC_WRITE,
      0,
      ffi.nullptr,
      CREATE_ALWAYS,
      FILE_ATTRIBUTE_NORMAL,
      0,
    );

  if (hFileWrite == INVALID_HANDLE_VALUE) {
    _writeConsole(hConsole, "❌ Failed to create file.\n");
    return;
  }

  final content = "Hello from WinDart!\nThis was written using WriteFile.\n";
  final contentPtr = content.toNativeUtf16();
  final bytesWritten = calloc<ffi.Uint32>();

  Kernel32.writeFile(
    hFileWrite,
    contentPtr.cast(),
    content.length * 2, // UTF-16 = 2 bytes per code unit
    bytesWritten,
    ffi.nullptr,
  );

  Kernel32.closeHandle(hFileWrite);
  calloc.free(contentPtr);
  calloc.free(bytesWritten);

  _writeConsole(hConsole, "✅ Wrote test.txt\n");

  // --- 2. Read file back ---
  final hFileRead = Kernel32.createFileW(
    filePath,
    GENERIC_READ,
    FILE_SHARE_READ,
    ffi.nullptr,
    OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL,
    0,
  );

  if (hFileRead == INVALID_HANDLE_VALUE) {
    _writeConsole(hConsole, "❌ Failed to open file for reading.\n");
    return;
  }

  const bufferSize = 256;
  final buffer = calloc<ffi.Uint8>(bufferSize);
  final bytesRead = calloc<ffi.Uint32>();

  final ok = Kernel32.readFile(
    hFileRead,
    buffer.cast(),
    bufferSize,
    bytesRead,
    ffi.nullptr,
  );

  if (ok != 0 && bytesRead.value > 0) {
    // Interpret raw bytes as UTF-16 text
    final text = buffer.cast<Utf16>().toDartString(length: bytesRead.value ~/ 2);
    _writeConsole(hConsole, "📖 Read from test.txt:\n$text\n");
  } else {
    _writeConsole(hConsole, "❌ Failed to read file.\n");
  }

  Kernel32.closeHandle(hFileRead);
  calloc.free(buffer);
  calloc.free(bytesRead);
}

/// Write a Dart string to console
void _writeConsole(int hConsole, String text) {
  final ptr = text.toNativeUtf16();
  final written = calloc<ffi.Uint32>();
  Kernel32.writeConsoleW(hConsole, ptr, text.length, written, ffi.nullptr);
  calloc.free(ptr);
  calloc.free(written);
}
