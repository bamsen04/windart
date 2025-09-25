import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'package:windart/src/gdi32.public.dart';
import 'package:windart/src/user32.public.dart';

// MessageBoxW
typedef MessageBoxWC = ffi.Int32 Function(
  ffi.IntPtr hWnd,
  ffi.Pointer<Utf16> lpText,
  ffi.Pointer<Utf16> lpCaption,
  ffi.Uint32 uType,
);
typedef MessageBoxWDart = int Function(
  int hWnd,
  ffi.Pointer<Utf16> lpText,
  ffi.Pointer<Utf16> lpCaption,
  int uType,
);

// GetAsyncKeyState
typedef GetAsyncKeyStateC = ffi.Int16 Function(ffi.Int32 vKey);
typedef GetAsyncKeyStateDart = int Function(int vKey);

// GetCursorPos
typedef GetCursorPosC = ffi.Int32 Function(ffi.Pointer<Point> lpPoint);
typedef GetCursorPosDart = int Function(ffi.Pointer<Point> lpPoint);

// SetCursorPos
typedef SetCursorPosC = ffi.Int32 Function(ffi.Int32 X, ffi.Int32 Y);
typedef SetCursorPosDart = int Function(int X, int Y);

// ShowWindow
typedef ShowWindowC = ffi.Int32 Function(ffi.IntPtr hWnd, ffi.Int32 nCmdShow);
typedef ShowWindowDart = int Function(int hWnd, int nCmdShow);

// GetSystemMetrics
typedef GetSystemMetricsC = ffi.Int32 Function(ffi.Int32 nIndex);
typedef GetSystemMetricsDart = int Function(int nIndex);

// RegisterClassExW
typedef RegisterClassExWC = ffi.Uint16 Function(
  ffi.Pointer<WNDCLASSEXW> lpwcx,
);
typedef RegisterClassExWDart = int Function(
  ffi.Pointer<WNDCLASSEXW> lpwcx,
);

// CreateWindowExW
typedef CreateWindowExWC = ffi.IntPtr Function(
  ffi.Uint32 dwExStyle,
  ffi.Pointer<Utf16> lpClassName,
  ffi.Pointer<Utf16> lpWindowName,
  ffi.Uint32 dwStyle,
  ffi.Int32 X,
  ffi.Int32 Y,
  ffi.Int32 nWidth,
  ffi.Int32 nHeight,
  ffi.IntPtr hWndParent,
  ffi.IntPtr hMenu,
  ffi.IntPtr hInstance,
  ffi.Pointer<ffi.Void> lpParam,
);
typedef CreateWindowExWDart = int Function(
  int dwExStyle,
  ffi.Pointer<Utf16> lpClassName,
  ffi.Pointer<Utf16> lpWindowName,
  int dwStyle,
  int X,
  int Y,
  int nWidth,
  int nHeight,
  int hWndParent,
  int hMenu,
  int hInstance,
  ffi.Pointer<ffi.Void> lpParam,
);

// DefWindowProcW
typedef DefWindowProcWC = ffi.IntPtr Function(
  ffi.IntPtr hWnd,
  ffi.Uint32 Msg,
  ffi.IntPtr wParam,
  ffi.IntPtr lParam,
);
typedef DefWindowProcWDart = int Function(
  int hWnd,
  int Msg,
  int wParam,
  int lParam,
);

// UpdateWindow
typedef UpdateWindowC = ffi.Int32 Function(ffi.IntPtr hWnd);
typedef UpdateWindowDart = int Function(int hWnd);

// GetMessageW
typedef GetMessageWC = ffi.Int32 Function(
  ffi.Pointer<MSG> lpMsg,
  ffi.IntPtr hWnd,
  ffi.Uint32 wMsgFilterMin,
  ffi.Uint32 wMsgFilterMax,
);
typedef GetMessageWDart = int Function(
  ffi.Pointer<MSG> lpMsg,
  int hWnd,
  int wMsgFilterMin,
  int wMsgFilterMax,
);

// TranslateMessage
typedef TranslateMessageC = ffi.Int32 Function(
  ffi.Pointer<MSG> lpMsg,
);
typedef TranslateMessageDart = int Function(
  ffi.Pointer<MSG> lpMsg,
);

// DispatchMessageW
typedef DispatchMessageWC = ffi.IntPtr Function(
  ffi.Pointer<MSG> lpMsg,
);
typedef DispatchMessageWDart = int Function(
  ffi.Pointer<MSG> lpMsg,
);

// PostQuitMessage
typedef PostQuitMessageC = ffi.Void Function(ffi.Int32 nExitCode);
typedef PostQuitMessageDart = void Function(int nExitCode);

// BeginPaint
typedef BeginPaintC = ffi.IntPtr Function(
  ffi.IntPtr hWnd,
  ffi.Pointer<PAINTSTRUCT> lpPaint,
);
typedef BeginPaintDart = int Function(
  int hWnd,
  ffi.Pointer<PAINTSTRUCT> lpPaint,
);

// EndPaint
typedef EndPaintC = ffi.Int32 Function(
  ffi.IntPtr hWnd,
  ffi.Pointer<PAINTSTRUCT> lpPaint,
);
typedef EndPaintDart = int Function(
  int hWnd,
  ffi.Pointer<PAINTSTRUCT> lpPaint,
);

// SetTimer
typedef SetTimerC = ffi.UintPtr Function(
  ffi.IntPtr hWnd,
  ffi.UintPtr nIDEvent,
  ffi.Uint32 uElapse,
  ffi.Pointer<ffi.Void> lpTimerFunc,
);
typedef SetTimerDart = int Function(
  int hWnd,
  int nIDEvent,
  int uElapse,
  ffi.Pointer<ffi.Void> lpTimerFunc,
);

// KillTimer
typedef KillTimerC = ffi.Int32 Function(
  ffi.IntPtr hWnd,
  ffi.UintPtr uIDEvent,
);
typedef KillTimerDart = int Function(int hWnd, int uIDEvent);

// InvalidateRect
typedef InvalidateRectC = ffi.Int32 Function(
  ffi.IntPtr hWnd,
  ffi.Pointer<RECT> lpRect,
  ffi.Int32 bErase,
);
typedef InvalidateRectDart = int Function(
  int hWnd,
  ffi.Pointer<RECT> lpRect,
  int bErase,
);
