import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

// DC Management
typedef GetDCC = ffi.IntPtr Function(ffi.IntPtr);
typedef GetDCDart = int Function(int);

typedef ReleaseDCC = ffi.Int32 Function(ffi.IntPtr, ffi.IntPtr);
typedef ReleaseDCDart = int Function(int, int);

typedef CreateCompatibleDCC = ffi.IntPtr Function(ffi.IntPtr);
typedef CreateCompatibleDCDart = int Function(int);

typedef DeleteDCC = ffi.Int32 Function(ffi.IntPtr);
typedef DeleteDCDart = int Function(int);

// Bitmaps
typedef CreateCompatibleBitmapC = ffi.IntPtr Function(ffi.IntPtr, ffi.Int32, ffi.Int32);
typedef CreateCompatibleBitmapDart = int Function(int, int, int);

typedef SelectObjectC = ffi.IntPtr Function(ffi.IntPtr, ffi.IntPtr);
typedef SelectObjectDart = int Function(int, int);

typedef DeleteObjectC = ffi.Int32 Function(ffi.IntPtr);
typedef DeleteObjectDart = int Function(int);

typedef BitBltC = ffi.Int32 Function(
  ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32,
  ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Uint32);
typedef BitBltDart = int Function(
  int, int, int, int, int,
  int, int, int, int);

// Brushes & Pens
typedef CreatePenC = ffi.IntPtr Function(ffi.Int32, ffi.Int32, ffi.Uint32);
typedef CreatePenDart = int Function(int, int, int);

typedef CreateSolidBrushC = ffi.IntPtr Function(ffi.Uint32);
typedef CreateSolidBrushDart = int Function(int);

typedef MoveToExC = ffi.Int32 Function(ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Pointer<ffi.Void>);
typedef MoveToExDart = int Function(int, int, int, ffi.Pointer<ffi.Void>);

typedef LineToC = ffi.Int32 Function(ffi.IntPtr, ffi.Int32, ffi.Int32);
typedef LineToDart = int Function(int, int, int);

typedef RectangleC = ffi.Int32 Function(ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32);
typedef RectangleDart = int Function(int, int, int, int, int);

typedef EllipseC = ffi.Int32 Function(ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32);
typedef EllipseDart = int Function(int, int, int, int, int);

typedef FillRectC = ffi.Int32 Function(ffi.IntPtr, ffi.Pointer<ffi.Void>, ffi.IntPtr);
typedef FillRectDart = int Function(int, ffi.Pointer<ffi.Void>, int);

// Text
typedef TextOutWC = ffi.Int32 Function(
  ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Pointer<Utf16>, ffi.Int32);
typedef TextOutWDart = int Function(int, int, int, ffi.Pointer<Utf16>, int);

typedef SetTextColorC = ffi.Uint32 Function(ffi.IntPtr, ffi.Uint32);
typedef SetTextColorDart = int Function(int, int);

typedef SetBkModeC = ffi.Int32 Function(ffi.IntPtr, ffi.Int32);
typedef SetBkModeDart = int Function(int, int);

// Regions / Clipping
typedef SelectClipRgnC = ffi.Int32 Function(ffi.IntPtr, ffi.IntPtr);
typedef SelectClipRgnDart = int Function(int, int);

typedef IntersectClipRectC = ffi.Int32 Function(
  ffi.IntPtr, ffi.Int32, ffi.Int32, ffi.Int32, ffi.Int32);
typedef IntersectClipRectDart = int Function(int, int, int, int, int);

typedef GetStockObjectC = ffi.IntPtr Function(ffi.Int32);
typedef GetStockObjectDart = int Function(int);