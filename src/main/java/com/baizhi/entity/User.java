package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Table(name = "d_user")
public class User {
  @Id
  private String id;
  private String nickName;
  private String email;
  private String password;
  private String status;
  private java.sql.Date registTime;
  private String salt;

}
