import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';
import 'kernel32.typedef.dart';

class Kernel32 {
  static final ffi.DynamicLibrary _lib = ffi.DynamicLibrary.open("kernel32.dll");

  static final _createProcessW = _lib.lookupFunction<CreateProcessWC, CreateProcessWDart>("CreateProcessW");
  static final _exitProcess = _lib.lookupFunction<ExitProcessC, ExitProcessDart>("ExitProcess");
  static final _getCurrentProcessId = _lib.lookupFunction<GetCurrentProcessIdC, GetCurrentProcessIdDart>("GetCurrentProcessId");
  static final _sleep = _lib.lookupFunction<SleepC, SleepDart>("Sleep");

  static final _createFileW = _lib.lookupFunction<CreateFileWC, CreateFileWDart>("CreateFileW");
  static final _readFile = _lib.lookupFunction<ReadFileC, ReadFileDart>("ReadFile");
  static final _writeFile = _lib.lookupFunction<WriteFileC, WriteFileDart>("WriteFile");
  static final _closeHandle = _lib.lookupFunction<CloseHandleC, CloseHandleDart>("CloseHandle");

  static final _allocConsole = _lib.lookupFunction<AllocConsoleC, AllocConsoleDart>("AllocConsole");
  static final _freeConsole = _lib.lookupFunction<FreeConsoleC, FreeConsoleDart>("FreeConsole");
  static final _getStdHandle = _lib.lookupFunction<GetStdHandleC, GetStdHandleDart>("GetStdHandle");
  static final _writeConsoleW = _lib.lookupFunction<WriteConsoleWC, WriteConsoleWDart>("WriteConsoleW");

  static final _getModuleHandleW = _lib.lookupFunction<GetModuleHandleWC, GetModuleHandleWDart>("GetModuleHandleW");
  static final _getModuleFileNameW = _lib.lookupFunction<GetModuleFileNameWC, GetModuleFileNameWDart>("GetModuleFileNameW");
  static final _loadLibraryW = _lib.lookupFunction<LoadLibraryWC, LoadLibraryWDart>("LoadLibraryW");
  static final _freeLibrary = _lib.lookupFunction<FreeLibraryC, FreeLibraryDart>("FreeLibrary");
  static final _getProcAddress = _lib.lookupFunction<GetProcAddressC, GetProcAddressDart>("GetProcAddress");

  static final _getCommandLineW = _lib.lookupFunction<GetCommandLineWC, GetCommandLineWDart>("GetCommandLineW");
  static final _getEnvironmentVariableW = _lib.lookupFunction<GetEnvironmentVariableWC, GetEnvironmentVariableWDart>("GetEnvironmentVariableW");

  static int createProcessW(
    ffi.Pointer<Utf16> appName,
    ffi.Pointer<Utf16> cmdLine,
    ffi.Pointer<ffi.Void> procAttrs,
    ffi.Pointer<ffi.Void> threadAttrs,
    int inheritHandles,
    int creationFlags,
    ffi.Pointer<ffi.Void> env,
    ffi.Pointer<Utf16> currentDir,
    ffi.Pointer<ffi.Void> startupInfo,
    ffi.Pointer<ffi.Void> processInfo,
  ) =>
      _createProcessW(appName, cmdLine, procAttrs, threadAttrs, inheritHandles,
          creationFlags, env, currentDir, startupInfo, processInfo);

  static void exitProcess(int code) => _exitProcess(code);

  static int getCurrentProcessId() => _getCurrentProcessId();

  static void sleep(int ms) => _sleep(ms);

  static int createFileW(
    ffi.Pointer<Utf16> fileName,
    int access,
    int shareMode,
    ffi.Pointer<ffi.Void> secAttrs,
    int creationDisposition,
    int flagsAndAttrs,
    int templateFile,
  ) =>
      _createFileW(fileName, access, shareMode, secAttrs, creationDisposition,
          flagsAndAttrs, templateFile);

  static int readFile(
    int hFile,
    ffi.Pointer<ffi.Void> buffer,
    int toRead,
    ffi.Pointer<ffi.Uint32> read,
    ffi.Pointer<ffi.Void> overlapped,
  ) =>
      _readFile(hFile, buffer, toRead, read, overlapped);

  static int writeFile(
    int hFile,
    ffi.Pointer<ffi.Void> buffer,
    int toWrite,
    ffi.Pointer<ffi.Uint32> written,
    ffi.Pointer<ffi.Void> overlapped,
  ) =>
      _writeFile(hFile, buffer, toWrite, written, overlapped);

  static int closeHandle(int handle) => _closeHandle(handle);

  static int allocConsole() => _allocConsole();
  static int freeConsole() => _freeConsole();

  static int getStdHandle(int nStdHandle) => _getStdHandle(nStdHandle);

  static int writeConsoleW(
    int hConsoleOutput,
    ffi.Pointer<Utf16> buffer,
    int charsToWrite,
    ffi.Pointer<ffi.Uint32> charsWritten,
    ffi.Pointer<ffi.Void> reserved,
  ) =>
      _writeConsoleW(
          hConsoleOutput, buffer, charsToWrite, charsWritten, reserved);

  static int getModuleHandleW(ffi.Pointer<Utf16> moduleName) =>
      _getModuleHandleW(moduleName);

  static int getModuleFileNameW(
          int hModule, ffi.Pointer<Utf16> buffer, int size) =>
      _getModuleFileNameW(hModule, buffer, size);

  static int loadLibraryW(ffi.Pointer<Utf16> fileName) =>
      _loadLibraryW(fileName);

  static int freeLibrary(int hModule) => _freeLibrary(hModule);

  static int getProcAddress(int hModule, ffi.Pointer<ffi.Int8> name) =>
      _getProcAddress(hModule, name);

  static ffi.Pointer<Utf16> getCommandLineW() => _getCommandLineW();

  static int getEnvironmentVariableW(
    ffi.Pointer<Utf16> name,
    ffi.Pointer<Utf16> buffer,
    int size,
  ) =>
      _getEnvironmentVariableW(name, buffer, size);

  static final _readConsoleW =
    _lib.lookupFunction<ReadConsoleWC, ReadConsoleWDart>("ReadConsoleW");

  static int readConsoleW(
    int hConsoleInput,
    ffi.Pointer<ffi.Void> buffer,
    int charsToRead,
    ffi.Pointer<ffi.Uint32> charsRead,
    ffi.Pointer<ffi.Void> reserved,
  ) =>
      _readConsoleW(hConsoleInput, buffer, charsToRead, charsRead, reserved);

}
