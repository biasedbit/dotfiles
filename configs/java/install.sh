# #!/usr/bin/env bash
#
# Installs a version of Oracle's JDK at /Library/Java/JavaVirtualMachines/

install_java () {
  local version="$1"
  local jdk_version="$2"
  local dl_tmp="jdk$version"

  previous_install=$(/usr/libexec/java_home -v "1.$version" -F)
  if [[ $? == 0 ]]; then
    echo "* Java $version already installed at '$previous_install'"
    read -p "  Continue installing '$jdk_version'? (y/N) " action

    local proceed=false
    case "$action" in
      y|Y )
        proceed=true; break;;
      * )
        proceed=false;;
    esac

    if [[ "$proceed" != "true" ]]; then
      echo "* Skipping installation of Java $version."
      return
    fi
  fi

  echo "* Downloading and installing Java $version SDK (Oracle)..."

  curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$jdk_version.dmg" -o "$HOME/Downloads/$dl_tmp.dmg"

  # Mount the image and grab the device and volume it was mounted on
  HDIUTIL_OUT=$(hdiutil attach "$HOME/Downloads/$dl_tmp.dmg")
  DEVICE=$(echo "$HDIUTIL_OUT" | grep 'GUID_partition_scheme' | cut -f1)
  VOLUME=$(echo "$HDIUTIL_OUT" | grep "/Volumes/" | cut -f3)

  # Install the .pkg file
  echo "* Installing package (requires sudo)..."
  PKG_FILE=$(ls "$VOLUME"/*.pkg)
  sudo installer -pkg "$PKG_FILE" -target /

  # Unmount the image and delete the downloaded file
  hdiutil detach $DEVICE
  rm -rf "$HOME/Downloads/$dl_tmp.dmg"
  echo "* Done"
}

install_java 7 7u80-b15/jdk-7u80-macosx-x64
install_java 8 8u66-b17/jdk-8u66-macosx-x64
