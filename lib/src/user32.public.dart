import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart' as ffi;

sealed class Point extends ffi.Struct {
  @ffi.Int32()
  external int x;

  @ffi.Int32()
  external int y;
}

class CursorPos {
  final int x;
  final int y;
  CursorPos(this.x, this.y);

  factory CursorPos.fromPointer(ffi.Pointer<Point> ptr) {
    return CursorPos(ptr.ref.x, ptr.ref.y);
  }
}

sealed class MSG extends ffi.Struct {
  @ffi.IntPtr()
  external int hwnd;

  @ffi.Uint32()
  external int message;

  @ffi.IntPtr()
  external int wParam;

  @ffi.IntPtr()
  external int lParam;

  @ffi.Uint32()
  external int time;

  @ffi.Int32()
  external int pt_x;

  @ffi.Int32()
  external int pt_y;
}

typedef WndProcC = ffi.IntPtr Function(
  ffi.IntPtr hWnd,
  ffi.Uint32 msg,
  ffi.IntPtr wParam,
  ffi.IntPtr lParam,
);

sealed class WNDCLASSEXW extends ffi.Struct {
  @ffi.Uint32()
  external int cbSize;

  @ffi.Uint32()
  external int style;

  external ffi.Pointer<ffi.NativeFunction<WndProcC>> lpfnWndProc;

  @ffi.Int32()
  external int cbClsExtra;

  @ffi.Int32()
  external int cbWndExtra;

  @ffi.IntPtr()
  external int hInstance;

  @ffi.IntPtr()
  external int hIcon;

  @ffi.IntPtr()
  external int hCursor;

  @ffi.IntPtr()
  external int hbrBackground;

  external ffi.Pointer<ffi.Utf16> lpszMenuName;
  external ffi.Pointer<ffi.Utf16> lpszClassName;

  @ffi.IntPtr()
  external int hIconSm;
}
