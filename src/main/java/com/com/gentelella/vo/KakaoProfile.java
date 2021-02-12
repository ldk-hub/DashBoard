package com.com.gentelella.vo;


import lombok.Data;

@Data
public class KakaoProfile {
 public Integer id;
 public String connected_at;
 public Properties properties;
 public KakaoAccount kakao_account;

 @Data
 public class Properties {
  public String nickname;
  public String profile_image;
  public String thumbnail_image;
 }

 @Data
 public class KakaoAccount {
  public Boolean profile_needs_agreement;
  public Profile profile;
  public Boolean has_email;
  public Boolean email_needs_agreement;
  

  @Data
  public class Profile {
   public String nickname;
   public String thumbnail_image_url;
   public String profile_image_url;
  }
 }
}
