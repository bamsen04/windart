import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/windart.dart';

final ffi.Pointer<ffi.NativeFunction<WndProcC>> _wndProc =
    ffi.Pointer.fromFunction<WndProcC>(_windowProc, 0);

int _windowProc(int hWnd, int msg, int wParam, int lParam) {
  switch (msg) {
    case WM_DESTROY:
      User32.postQuitMessage(0);
      return 0;
    default:
      return User32.defWindowProcW(hWnd, msg, wParam, lParam);
  }
}

void main() {
  final className = "EmptyDartWindow".toNativeUtf16();
  final windowName = "Windart Empty Window".toNativeUtf16();

  final wc = calloc<WNDCLASSEXW>();
  wc.ref.cbSize = ffi.sizeOf<WNDCLASSEXW>();
  wc.ref.lpfnWndProc = _wndProc;
  wc.ref.lpszClassName = className;

  final atom = User32.registerClassExW(wc);
  if (atom == 0) {
    print("Failed to register window class");
    calloc.free(className);
    calloc.free(windowName);
    calloc.free(wc);
    return;
  }

  final hWnd = User32.createWindowExW(
    0,
    className,
    windowName,
    WS_OVERLAPPEDWINDOW,
    CW_USEDEFAULT,
    CW_USEDEFAULT,
    800,
    600,
    0,
    0,
    0,
    ffi.nullptr,
  );

  if (hWnd == 0) {
    print("Failed to create window");
    calloc.free(className);
    calloc.free(windowName);
    calloc.free(wc);
    return;
  }

  User32.showWindow(hWnd, SW_SHOW);
  User32.updateWindow(hWnd);

  final msg = calloc<MSG>();
  while (User32.getMessageW(msg, 0, 0, 0) > 0) {
    User32.translateMessage(msg);
    User32.dispatchMessageW(msg);
  }

  calloc.free(className);
  calloc.free(windowName);
  calloc.free(wc);
  calloc.free(msg);
}
