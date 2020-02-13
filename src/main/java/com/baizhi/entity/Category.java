package com.baizhi.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@Table(name = "d_category")
public class Category implements Serializable {
  @Id
  private String id;
  private String cateName;
  private String count;
  private String parentId;
  private String levels;
  @Transient
  private Category category;

  private List<Category> categoryList;
}
