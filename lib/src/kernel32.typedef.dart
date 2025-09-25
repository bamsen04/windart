import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

typedef CreateProcessWC = ffi.Int32 Function(
  ffi.Pointer<Utf16>,
  ffi.Pointer<Utf16>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  ffi.Int32,
  ffi.Uint32,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<Utf16>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
);
typedef CreateProcessWDart = int Function(
  ffi.Pointer<Utf16>,
  ffi.Pointer<Utf16>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
  int,
  int,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<Utf16>,
  ffi.Pointer<ffi.Void>,
  ffi.Pointer<ffi.Void>,
);

typedef ExitProcessC = ffi.Void Function(ffi.Uint32);
typedef ExitProcessDart = void Function(int);

typedef GetCurrentProcessIdC = ffi.Uint32 Function();
typedef GetCurrentProcessIdDart = int Function();

typedef SleepC = ffi.Void Function(ffi.Uint32);
typedef SleepDart = void Function(int);

typedef CreateFileWC = ffi.IntPtr Function(
  ffi.Pointer<Utf16>,
  ffi.Uint32,
  ffi.Uint32,
  ffi.Pointer<ffi.Void>,
  ffi.Uint32,
  ffi.Uint32,
  ffi.IntPtr,
);
typedef CreateFileWDart = int Function(
  ffi.Pointer<Utf16>,
  int,
  int,
  ffi.Pointer<ffi.Void>,
  int,
  int,
  int,
);

typedef ReadFileC = ffi.Int32 Function(
  ffi.IntPtr,
  ffi.Pointer<ffi.Void>,
  ffi.Uint32,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);
typedef ReadFileDart = int Function(
  int,
  ffi.Pointer<ffi.Void>,
  int,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);

typedef WriteFileC = ffi.Int32 Function(
  ffi.IntPtr,
  ffi.Pointer<ffi.Void>,
  ffi.Uint32,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);
typedef WriteFileDart = int Function(
  int,
  ffi.Pointer<ffi.Void>,
  int,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);

typedef CloseHandleC = ffi.Int32 Function(ffi.IntPtr);
typedef CloseHandleDart = int Function(int);

typedef AllocConsoleC = ffi.Int32 Function();
typedef AllocConsoleDart = int Function();

typedef FreeConsoleC = ffi.Int32 Function();
typedef FreeConsoleDart = int Function();

typedef GetStdHandleC = ffi.IntPtr Function(ffi.Uint32);
typedef GetStdHandleDart = int Function(int);

typedef WriteConsoleWC = ffi.Int32 Function(
  ffi.IntPtr,
  ffi.Pointer<Utf16>,
  ffi.Uint32,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);
typedef WriteConsoleWDart = int Function(
  int,
  ffi.Pointer<Utf16>,
  int,
  ffi.Pointer<ffi.Uint32>,
  ffi.Pointer<ffi.Void>,
);

typedef GetModuleHandleWC = ffi.IntPtr Function(ffi.Pointer<Utf16>);
typedef GetModuleHandleWDart = int Function(ffi.Pointer<Utf16>);

typedef GetModuleFileNameWC = ffi.Uint32 Function(
  ffi.IntPtr,
  ffi.Pointer<Utf16>,
  ffi.Uint32,
);
typedef GetModuleFileNameWDart = int Function(
  int,
  ffi.Pointer<Utf16>,
  int,
);

typedef LoadLibraryWC = ffi.IntPtr Function(ffi.Pointer<Utf16>);
typedef LoadLibraryWDart = int Function(ffi.Pointer<Utf16>);

typedef FreeLibraryC = ffi.Int32 Function(ffi.IntPtr);
typedef FreeLibraryDart = int Function(int);

typedef GetProcAddressC = ffi.IntPtr Function(ffi.IntPtr, ffi.Pointer<ffi.Int8>);
typedef GetProcAddressDart = int Function(int, ffi.Pointer<ffi.Int8>);

typedef GetCommandLineWC = ffi.Pointer<Utf16> Function();
typedef GetCommandLineWDart = ffi.Pointer<Utf16> Function();

typedef GetEnvironmentVariableWC = ffi.Uint32 Function(
  ffi.Pointer<Utf16>,
  ffi.Pointer<Utf16>,
  ffi.Uint32,
);
typedef GetEnvironmentVariableWDart = int Function(
  ffi.Pointer<Utf16>,
  ffi.Pointer<Utf16>,
  int,
);

typedef ReadConsoleWC = ffi.Int32 Function(
  ffi.IntPtr hConsoleInput,
  ffi.Pointer<ffi.Void> lpBuffer,
  ffi.Uint32 nNumberOfCharsToRead,
  ffi.Pointer<ffi.Uint32> lpNumberOfCharsRead,
  ffi.Pointer<ffi.Void> lpReserved,
);
typedef ReadConsoleWDart = int Function(
  int hConsoleInput,
  ffi.Pointer<ffi.Void> lpBuffer,
  int nNumberOfCharsToRead,
  ffi.Pointer<ffi.Uint32> lpNumberOfCharsRead,
  ffi.Pointer<ffi.Void> lpReserved,
);
