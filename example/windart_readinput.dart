import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void main() {
  // 1. Create a console window
  Kernel32.allocConsole();

  // 2. Get handles for input and output
  final hConsoleInput = Kernel32.getStdHandle(STD_INPUT_HANDLE);
  final hConsoleOutput = Kernel32.getStdHandle(STD_OUTPUT_HANDLE);

  // 3. Print a message
  final message = 'Type something and press Enter:\n';
  final msgPtr = message.toNativeUtf16();
  final charsWritten = calloc<ffi.Uint32>();
  Kernel32.writeConsoleW(hConsoleOutput, msgPtr, message.length, charsWritten, ffi.nullptr);
  calloc.free(msgPtr);
  calloc.free(charsWritten);

  // 4. Allocate a buffer for input (max 256 UTF-16 characters)
  const bufferSize = 256;
  final inputBuffer = calloc<ffi.Uint16>(bufferSize);
  final charsRead = calloc<ffi.Uint32>();

  // 5. Read from console (blocking until user presses Enter)
  Kernel32.readConsoleW(
    hConsoleInput,
    inputBuffer.cast(),
    bufferSize,
    charsRead,
    ffi.nullptr,
  );

  // 6. Convert UTF-16 buffer back to Dart string
  final dartString = inputBuffer.cast<Utf16>().toDartString(length: charsRead.value);

  // 7. Print the input back
  final echoMessage = '\nYou typed: $dartString\n';
  final echoPtr = echoMessage.toNativeUtf16();
  final echoWritten = calloc<ffi.Uint32>();
  Kernel32.writeConsoleW(hConsoleOutput, echoPtr, echoMessage.length, echoWritten, ffi.nullptr);

  // 8. Free all allocations
  calloc.free(inputBuffer);
  calloc.free(charsRead);
  calloc.free(echoPtr);
  calloc.free(echoWritten);
}
