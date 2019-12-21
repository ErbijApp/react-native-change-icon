import { Platform, NativeModules } from "react-native";

const { RNChangeIcon } = NativeModules;

const changeIcon = enableIcon => {
  if (Platform.OS === "ios") {
    RNChangeIcon.changeIcon(enableIcon);
  }
};

export { changeIcon };
