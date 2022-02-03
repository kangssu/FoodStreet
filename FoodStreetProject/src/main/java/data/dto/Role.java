package data.dto;

public enum Role {
  ADMIN("ROLE_ADMIN"), EXECUTIVE("ROLE_EXECUTIVE"), USER("ROLE_LOCAL"), SOCIAL("ROLE_SOCIAL");

  public String code;

  private Role(String code) {
    this.code = code;
  }

  public String getCode() {
    return code;
  }

  public static Role get(String code) {
    for (Role element : values()) {
      if (element.code.equalsIgnoreCase(code)) {
        return element;
      }
    }
    return null;
  }

  public static Role lookup(String code) {
    for (Role element : Role.values()) {
      if (element.code.equalsIgnoreCase(code)) {
        return element;
      }
    }
    return null;
  }
}
