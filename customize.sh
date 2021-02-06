  ui_print " "
  ui_print "******************************"
  ui_print "*   dnscrypt-proxy-android   *"
  ui_print "*           2.0.45           *"
  ui_print "******************************"
  ui_print "*          efek0349          *"
  ui_print "******************************"
  ui_print " "

# Get architecture specific binary file
  if [ "$ARCH" == "arm" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-android-arm
  elif [ "$ARCH" == "arm64" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-android-arm64
  elif [ "$ARCH" == "x86" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-android-i386
  elif [ "$ARCH" == "x64" ];then
    BINARY_PATH=$TMPDIR/binary/dnscrypt-proxy-android-x86_64
  fi

  CONFIG_PATH=$TMPDIR/config
  SECURE_DIR=/data/adb/service.d
  SERVICE_PATH=$TMPDIR/config/99-dnscrypt.sh


  unzip -o "$ZIPFILE" 'config/*' 'binary/*' -d $TMPDIR

  ui_print "* Creating binary path"
  mkdir -pv $MODPATH/system/bin

  ui_print "* Creating config & docs path"
  mkdir -p /data/media/0/dnscrypt-proxy/docs-upstream

  if [ -f "$BINARY_PATH" ]; then
    ui_print "* Copying binary for $ARCH"
    cp -afv $BINARY_PATH $MODPATH/system/bin/dnscrypt-proxy
  else
    abort "Binary file for $ARCH is missing!"
  fi

  if [ -d "$CONFIG_PATH" ]; then
    ui_print "* Copying example and license files"
    cp -arfv $CONFIG_PATH/* /data/media/0/dnscrypt-proxy/
  else
    abort "Config file is missing!"
  fi

CONFIG_FILE="/data/media/0/dnscrypt-proxy/dnscrypt-proxy.toml"

  if  [ -f "$CONFIG_FILE" ]; then

     ui_print "* Backing up config file"
    # cp -afv $CONFIG_FILE $TMPDIR
    # ui_print "* Restoring config files"
    # cp -af $TMPDIR/dnscrypt-proxy.toml $CONFIG_FILE

     cp -afv  $CONFIG_FILE ${CONFIG_FILE}-backup-`date +%Y%m%d%H%M%S`
  fi

cp -afv /data/media/0/dnscrypt-proxy/my-dnscrypt-proxy.toml $CONFIG_FILE
#cp -afv $SERVICE_PATH  $SECURE_DIR

  set_perm_recursive $MODPATH 0 0 0755 0755
  set_perm $MODPATH/system/bin/dnscrypt-proxy 0 0 0755
#  set_perm $SECURE_DIR/99-dnscrypt.sh 0 0 0755
