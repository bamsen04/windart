import 'dart:ffi' as ffi;

sealed class RECT extends ffi.Struct {
  @ffi.Int32()
  external int left;
  @ffi.Int32()
  external int top;
  @ffi.Int32()
  external int right;
  @ffi.Int32()
  external int bottom;
}

sealed class PAINTSTRUCT extends ffi.Struct {
  @ffi.IntPtr()
  external int hdc;

  @ffi.Int32()
  external int fErase;

  external RECT rcPaint;

  @ffi.Int32()
  external int fRestore;

  @ffi.Int32()
  external int fIncUpdate;

  @ffi.Uint8()
  external int rgbReserved1;
}
