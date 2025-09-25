import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'gdi32.typedef.dart';
import 'gdi32.public.dart';

class Gdi32 {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open("gdi32.dll");

  static final _getDC = _lib.lookupFunction<GetDCC, GetDCDart>("GetDC");
  static final _releaseDC = _lib.lookupFunction<ReleaseDCC, ReleaseDCDart>("ReleaseDC");
  static final _createCompatibleDC = _lib.lookupFunction<CreateCompatibleDCC, CreateCompatibleDCDart>("CreateCompatibleDC");
  static final _deleteDC = _lib.lookupFunction<DeleteDCC, DeleteDCDart>("DeleteDC");

  static final _createCompatibleBitmap =
      _lib.lookupFunction<CreateCompatibleBitmapC, CreateCompatibleBitmapDart>("CreateCompatibleBitmap");
  static final _selectObject = _lib.lookupFunction<SelectObjectC, SelectObjectDart>("SelectObject");
  static final _deleteObject = _lib.lookupFunction<DeleteObjectC, DeleteObjectDart>("DeleteObject");
  static final _bitBlt = _lib.lookupFunction<BitBltC, BitBltDart>("BitBlt");

  static final _createPen = _lib.lookupFunction<CreatePenC, CreatePenDart>("CreatePen");
  static final _createSolidBrush = _lib.lookupFunction<CreateSolidBrushC, CreateSolidBrushDart>("CreateSolidBrush");
  static final _moveToEx = _lib.lookupFunction<MoveToExC, MoveToExDart>("MoveToEx");
  static final _lineTo = _lib.lookupFunction<LineToC, LineToDart>("LineTo");
  static final _rectangle = _lib.lookupFunction<RectangleC, RectangleDart>("Rectangle");
  static final _ellipse = _lib.lookupFunction<EllipseC, EllipseDart>("Ellipse");
  static final _fillRect = _lib.lookupFunction<FillRectC, FillRectDart>("FillRect");

  static final _textOutW = _lib.lookupFunction<TextOutWC, TextOutWDart>("TextOutW");
  static final _setTextColor = _lib.lookupFunction<SetTextColorC, SetTextColorDart>("SetTextColor");
  static final _setBkMode = _lib.lookupFunction<SetBkModeC, SetBkModeDart>("SetBkMode");

  static final _selectClipRgn = _lib.lookupFunction<SelectClipRgnC, SelectClipRgnDart>("SelectClipRgn");
  static final _intersectClipRect = _lib.lookupFunction<IntersectClipRectC, IntersectClipRectDart>("IntersectClipRect");

  static int getDC(int hWnd) => _getDC(hWnd);
  static int releaseDC(int hWnd, int hDC) => _releaseDC(hWnd, hDC);
  static int createCompatibleDC(int hdc) => _createCompatibleDC(hdc);
  static int deleteDC(int hdc) => _deleteDC(hdc);

  static int createCompatibleBitmap(int hdc, int w, int h) =>
      _createCompatibleBitmap(hdc, w, h);
  static int selectObject(int hdc, int obj) => _selectObject(hdc, obj);
  static int deleteObject(int obj) => _deleteObject(obj);
  static int bitBlt(int hdcDest, int x, int y, int w, int h, int hdcSrc, int sx, int sy, int rop) =>
      _bitBlt(hdcDest, x, y, w, h, hdcSrc, sx, sy, rop);

  static int createPen(int style, int width, int color) =>
      _createPen(style, width, color);
  static int createSolidBrush(int color) => _createSolidBrush(color);
  static int moveToEx(int hdc, int x, int y, ffi.Pointer<ffi.Void> pt) =>
      _moveToEx(hdc, x, y, pt);
  static int lineTo(int hdc, int x, int y) => _lineTo(hdc, x, y);
  static int rectangle(int hdc, int l, int t, int r, int b) =>
      _rectangle(hdc, l, t, r, b);
  static int ellipse(int hdc, int l, int t, int r, int b) =>
      _ellipse(hdc, l, t, r, b);
  static int fillRect(int hdc, ffi.Pointer<RECT> rect, int brush) =>
      _fillRect(hdc, rect.cast<ffi.Void>(), brush);

  static int textOutW(int hdc, int x, int y, ffi.Pointer<Utf16> str, int len) =>
      _textOutW(hdc, x, y, str, len);
  static int setTextColor(int hdc, int color) => _setTextColor(hdc, color);
  static int setBkMode(int hdc, int mode) => _setBkMode(hdc, mode);

  static int selectClipRgn(int hdc, int hrgn) => _selectClipRgn(hdc, hrgn);
  static int intersectClipRect(int hdc, int l, int t, int r, int b) =>
      _intersectClipRect(hdc, l, t, r, b);

  static final _getStockObject =
    _lib.lookupFunction<GetStockObjectC, GetStockObjectDart>("GetStockObject");

  static int getStockObject(int index) => _getStockObject(index);
}
