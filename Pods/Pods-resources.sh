#!/bin/sh
set -e

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy-${TARGETNAME}.txt
> "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --reference-external-strings-file --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "mkdir -p ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      mkdir -p "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      echo "rsync -av ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -av "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodel)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1"`.mom\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodel`.mom"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc \"${PODS_ROOT}/$1\" \"${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd\""
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename "$1" .xcdatamodeld`.momd"
      ;;
    *.xcassets)
      ;;
    /*)
      echo "$1"
      echo "$1" >> "$RESOURCES_TO_COPY"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
install_resource "AutoLayoutKit/Assets"
install_resource "IQKeyboardManager/IQKeyBoardManager/IQKeyboardManager.bundle"
install_resource "NUI/NUI/Resources/NUIViewBackground.png"
install_resource "NUI/NUI/NUIStyle.nss"
install_resource "NUI/NUI/Themes/Blue.NUI.nss"
install_resource "NUI/NUI/Themes/Default.NUI.nss"
install_resource "NUI/NUI/Themes/Googolplex.NUI.nss"
install_resource "NUI/NUI/Themes/Round.NUI.nss"
install_resource "NUI/NUI/Themes/Route.NUI.nss"
install_resource "NUI/NUI/Themes/SkyBlue.NUI.nss"
install_resource "NUI/NUI/Themes/Switchboard.NUI.nss"
install_resource "SVProgressHUD/SVProgressHUD/SVProgressHUD.bundle"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundError.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundError@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundErrorIcon@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundMessage@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccess@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundSuccessIcon@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarning@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon.png"
install_resource "TSMessages/Pod/Assets/NotificationBackgroundWarningIcon@2x.png"
install_resource "TSMessages/Pod/Assets/NotificationButtonBackground.png"
install_resource "TSMessages/Pod/Assets/NotificationButtonBackground@2x.png"
install_resource "TSMessages/Pod/Assets/TSMessagesDefaultDesign.json"
install_resource "UI7Kit/Resources/UI7NavigationBarBackButton.png"
install_resource "UI7Kit/Resources/UI7NavigationBarBackButton@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowDown.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowDown@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowDownRight.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowDownRight@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSide.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSide@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSideBottom.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSideBottom@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSideTop.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowSideTop@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowUp.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowUp@2x.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowUpRight.png"
install_resource "UI7Kit/Resources/PopoverBackgroundArrowUpRight@2x.png"
install_resource "UI7Kit/Resources/UI7SliderThumb.png"
install_resource "UI7Kit/Resources/UI7SliderThumb@2x.png"
install_resource "UIKitResources/UIAccessoryButtonCheckmark.png"
install_resource "UIKitResources/UIAccessoryButtonCheckmark@2x.png"
install_resource "UIKitResources/UIAccessoryButtonExclamationMark.png"
install_resource "UIKitResources/UIAccessoryButtonExclamationMark@2x.png"
install_resource "UIKitResources/UIAccessoryButtonInfo.png"
install_resource "UIKitResources/UIAccessoryButtonInfo@2x.png"
install_resource "UIKitResources/UIAccessoryButtonMinus.png"
install_resource "UIKitResources/UIAccessoryButtonMinus@2x.png"
install_resource "UIKitResources/UIAccessoryButtonPlus.png"
install_resource "UIKitResources/UIAccessoryButtonPlus@2x.png"
install_resource "UIKitResources/UIAccessoryButtonQuestionMark.png"
install_resource "UIKitResources/UIAccessoryButtonQuestionMark@2x.png"
install_resource "UIKitResources/UIAccessoryButtonX.png"
install_resource "UIKitResources/UIAccessoryButtonX@2x.png"
install_resource "UIKitResources/UIButtonBarAction.png"
install_resource "UIKitResources/UIButtonBarAction@2x.png"
install_resource "UIKitResources/UIButtonBarActionSmall.png"
install_resource "UIKitResources/UIButtonBarActionSmall@2x.png"
install_resource "UIKitResources/UIButtonBarAirPlay.png"
install_resource "UIKitResources/UIButtonBarAirPlay@2x.png"
install_resource "UIKitResources/UIButtonBarAirplayLandscape.png"
install_resource "UIKitResources/UIButtonBarAirplayLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarArrowDown.png"
install_resource "UIKitResources/UIButtonBarArrowDown@2x.png"
install_resource "UIKitResources/UIButtonBarArrowDownSmall.png"
install_resource "UIKitResources/UIButtonBarArrowDownSmall@2x.png"
install_resource "UIKitResources/UIButtonBarArrowLeft.png"
install_resource "UIKitResources/UIButtonBarArrowLeft@2x.png"
install_resource "UIKitResources/UIButtonBarArrowLeftLandscape.png"
install_resource "UIKitResources/UIButtonBarArrowLeftLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarArrowRight.png"
install_resource "UIKitResources/UIButtonBarArrowRight@2x.png"
install_resource "UIKitResources/UIButtonBarArrowRightLandscape.png"
install_resource "UIKitResources/UIButtonBarArrowRightLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarArrowUp.png"
install_resource "UIKitResources/UIButtonBarArrowUp@2x.png"
install_resource "UIKitResources/UIButtonBarArrowUpSmall.png"
install_resource "UIKitResources/UIButtonBarArrowUpSmall@2x.png"
install_resource "UIKitResources/UIButtonBarBadge.png"
install_resource "UIKitResources/UIButtonBarBadge@2x.png"
install_resource "UIKitResources/UIButtonBarBookmarks.png"
install_resource "UIKitResources/UIButtonBarBookmarks@2x.png"
install_resource "UIKitResources/UIButtonBarBookmarksLandscape.png"
install_resource "UIKitResources/UIButtonBarBookmarksLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarCamera.png"
install_resource "UIKitResources/UIButtonBarCamera@2x.png"
install_resource "UIKitResources/UIButtonBarCameraSmall.png"
install_resource "UIKitResources/UIButtonBarCameraSmall@2x.png"
install_resource "UIKitResources/UIButtonBarCompose.png"
install_resource "UIKitResources/UIButtonBarCompose@2x.png"
install_resource "UIKitResources/UIButtonBarComposeLandscape.png"
install_resource "UIKitResources/UIButtonBarComposeLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarDefaultBackground.png"
install_resource "UIKitResources/UIButtonBarDefaultBackground@2x.png"
install_resource "UIKitResources/UIButtonBarFastForward.png"
install_resource "UIKitResources/UIButtonBarFastForward@2x.png"
install_resource "UIKitResources/UIButtonBarFastForwardLandscape.png"
install_resource "UIKitResources/UIButtonBarFastForwardLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarListIcon.png"
install_resource "UIKitResources/UIButtonBarListIcon@2x.png"
install_resource "UIKitResources/UIButtonBarLocate.png"
install_resource "UIKitResources/UIButtonBarLocate@2x.png"
install_resource "UIKitResources/UIButtonBarLocateSmall.png"
install_resource "UIKitResources/UIButtonBarLocateSmall@2x.png"
install_resource "UIKitResources/UIButtonBarMiniDefaultBackground.png"
install_resource "UIKitResources/UIButtonBarMiniDefaultBackground@2x.png"
install_resource "UIKitResources/UIButtonBarNew.png"
install_resource "UIKitResources/UIButtonBarNew@2x.png"
install_resource "UIKitResources/UIButtonBarNewLandscape.png"
install_resource "UIKitResources/UIButtonBarNewLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarNewSmall.png"
install_resource "UIKitResources/UIButtonBarNewSmall@2x.png"
install_resource "UIKitResources/UIButtonBarOrganize.png"
install_resource "UIKitResources/UIButtonBarOrganize@2x.png"
install_resource "UIKitResources/UIButtonBarOrganizeLandscape.png"
install_resource "UIKitResources/UIButtonBarOrganizeLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarPause.png"
install_resource "UIKitResources/UIButtonBarPause@2x.png"
install_resource "UIKitResources/UIButtonBarPauseLandscape.png"
install_resource "UIKitResources/UIButtonBarPauseLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarPlay.png"
install_resource "UIKitResources/UIButtonBarPlay@2x.png"
install_resource "UIKitResources/UIButtonBarPlayLandscape.png"
install_resource "UIKitResources/UIButtonBarPlayLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarPlus.png"
install_resource "UIKitResources/UIButtonBarPlus@2x.png"
install_resource "UIKitResources/UIButtonBarRefresh.png"
install_resource "UIKitResources/UIButtonBarRefresh@2x.png"
install_resource "UIKitResources/UIButtonBarRefreshLandscape.png"
install_resource "UIKitResources/UIButtonBarRefreshLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarReply.png"
install_resource "UIKitResources/UIButtonBarReply@2x.png"
install_resource "UIKitResources/UIButtonBarReplyLandscape.png"
install_resource "UIKitResources/UIButtonBarReplyLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarRewind.png"
install_resource "UIKitResources/UIButtonBarRewind@2x.png"
install_resource "UIKitResources/UIButtonBarRewindLandscape.png"
install_resource "UIKitResources/UIButtonBarRewindLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarSearch.png"
install_resource "UIKitResources/UIButtonBarSearch@2x.png"
install_resource "UIKitResources/UIButtonBarShadow.png"
install_resource "UIKitResources/UIButtonBarShadow@2x.png"
install_resource "UIKitResources/UIButtonBarStop.png"
install_resource "UIKitResources/UIButtonBarStop@2x.png"
install_resource "UIKitResources/UIButtonBarStopLandscape.png"
install_resource "UIKitResources/UIButtonBarStopLandscape@2x.png"
install_resource "UIKitResources/UIButtonBarTrash.png"
install_resource "UIKitResources/UIButtonBarTrash@2x.png"
install_resource "UIKitResources/UIButtonBarTrashLandscape.png"
install_resource "UIKitResources/UIButtonBarTrashLandscape@2x.png"
install_resource "UIKitResources/UITabBarBookmarksTemplate.png"
install_resource "UIKitResources/UITabBarBookmarksTemplate@2x.png"
install_resource "UIKitResources/UITabBarBookmarksTemplateSelected.png"
install_resource "UIKitResources/UITabBarBookmarksTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarContactsTemplate.png"
install_resource "UIKitResources/UITabBarContactsTemplate@2x.png"
install_resource "UIKitResources/UITabBarContactsTemplateSelected.png"
install_resource "UIKitResources/UITabBarContactsTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarDownloadsTemplate.png"
install_resource "UIKitResources/UITabBarDownloadsTemplate@2x.png"
install_resource "UIKitResources/UITabBarDownloadsTemplateSelected.png"
install_resource "UIKitResources/UITabBarDownloadsTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarFavoritesTemplate.png"
install_resource "UIKitResources/UITabBarFavoritesTemplate@2x.png"
install_resource "UIKitResources/UITabBarFavoritesTemplateSelected.png"
install_resource "UIKitResources/UITabBarFavoritesTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarHistoryTemplate.png"
install_resource "UIKitResources/UITabBarHistoryTemplate@2x.png"
install_resource "UIKitResources/UITabBarHistoryTemplateSelected.png"
install_resource "UIKitResources/UITabBarHistoryTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarMoreTemplate.png"
install_resource "UIKitResources/UITabBarMoreTemplate@2x.png"
install_resource "UIKitResources/UITabBarMoreTemplateSelected.png"
install_resource "UIKitResources/UITabBarMoreTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarMostViewedTemplate.png"
install_resource "UIKitResources/UITabBarMostViewedTemplate@2x.png"
install_resource "UIKitResources/UITabBarMostViewedTemplateSelected.png"
install_resource "UIKitResources/UITabBarMostViewedTemplateSelected@2x.png"
install_resource "UIKitResources/UITabBarSearchTemplate.png"
install_resource "UIKitResources/UITabBarSearchTemplate@2x.png"
install_resource "UIKitResources/UITabBarSearchTemplateSelected.png"
install_resource "UIKitResources/UITabBarSearchTemplateSelected@2x.png"
install_resource "${BUILT_PRODUCTS_DIR}/Appirater.bundle"
install_resource "${BUILT_PRODUCTS_DIR}/EasyMailSender.bundle"

rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
if [[ "${ACTION}" == "install" ]]; then
  rsync -avr --copy-links --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
rm -f "$RESOURCES_TO_COPY"

if [[ -n "${WRAPPER_EXTENSION}" ]] && [ `xcrun --find actool` ] && [ `find . -name '*.xcassets' | wc -l` -ne 0 ]
then
  case "${TARGETED_DEVICE_FAMILY}" in 
    1,2)
      TARGET_DEVICE_ARGS="--target-device ipad --target-device iphone"
      ;;
    1)
      TARGET_DEVICE_ARGS="--target-device iphone"
      ;;
    2)
      TARGET_DEVICE_ARGS="--target-device ipad"
      ;;
    *)
      TARGET_DEVICE_ARGS="--target-device mac"
      ;;  
  esac 
  find "${PWD}" -name "*.xcassets" -print0 | xargs -0 actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${IPHONEOS_DEPLOYMENT_TARGET}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
fi
