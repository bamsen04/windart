import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void main() {
  // Allocate a new console window for this process
  Kernel32.allocConsole();

  // Get a handle to the standard output (console output)
  final hConsoleOutput = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  // The text we want to print
  final message = 'Hello, World from WinDart!\n';

  // Convert the Dart string to a native UTF-16 pointer
  final buffer = message.toNativeUtf16();

  // Number of characters to write
  final charsToWrite = message.length;

  // Pointer where WriteConsoleW will write the number of chars actually written
  final charsWritten = calloc<ffi.Uint32>();

  // Reserved must be null
  final reserved = ffi.nullptr;

  // Call the Windows API WriteConsoleW to print to the console
  Kernel32.writeConsoleW(
    hConsoleOutput,
    buffer,
    charsToWrite,
    charsWritten,
    reserved,
  );

  // Free the memory we allocated
  calloc.free(buffer);
  calloc.free(charsWritten);
}
