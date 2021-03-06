TERMUX_PKG_HOMEPAGE=https://lldb.llvm.org
TERMUX_PKG_DESCRIPTION="LLVM based debugger"
TERMUX_PKG_VERSION=7.0.0
TERMUX_PKG_SHA256=7ff6d8fee49977d25b3b69be7d22937b92592c7609cf283ed0dcf9e5cd80aa32
TERMUX_PKG_SRCURL=https://releases.llvm.org/${TERMUX_PKG_VERSION}/lldb-$TERMUX_PKG_VERSION.src.tar.xz
TERMUX_PKG_DEPENDS="libedit, libllvm, libxml2, ncurses-ui-libs"
TERMUX_PKG_BLACKLISTED_ARCHES="i686"
TERMUX_PKG_HAS_DEBUG=no
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DLLDB_DISABLE_CURSES=0
-DLLDB_DISABLE_LIBEDIT=0
-DLLDB_DISABLE_PYTHON=1
-DLLVM_CONFIG=$TERMUX_PREFIX/bin/llvm-config
-DLLVM_ENABLE_TERMINFO=1
-DLLVM_LINK_LLVM_DYLIB=ON
"

termux_step_pre_configure() {
	LDFLAGS+=" -Wl,--exclude-libs=libLLVMSupport.a"
}

termux_step_post_make_install() {
	cp $TERMUX_PKG_SRCDIR/docs/lldb.1 $TERMUX_PREFIX/share/man/man1
}
