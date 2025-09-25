
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

void main() {
  // Create a message box
  User32.messageBoxW(0, "Message Box Description".toNativeUtf16(), "Message Box".toNativeUtf16(), MB_OKCANCEL | MB_ICONEXCLAMATION);
  User32.messageBoxW(0, "No buttons other than ok".toNativeUtf16(), "Just one button".toNativeUtf16(), 0);
  User32.messageBoxW(0, "This is not infact an error.".toNativeUtf16(), "This is not an error".toNativeUtf16(), MB_ICONHAND);
}