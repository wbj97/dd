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
@Table(name = "d_book")
public class Book {
  @Id
  private String id;
  private String bookName;
  private String author;
  private String price;
  private String ddPrice;
  private String company;
  private java.sql.Date publishTime;
  private String publicCount;
  private String isbn;
  private java.sql.Date printTime;
  private String printCount;
  private String saleCount;
  private String cateId;
  private String eRecommend;
  private String src;
  private String stock;
  private String edition;
  private String impression;
  private String format;
  private String paper;
  private String packaging;
  private String pagination;
  private String recom;
  private String brief;
  private String aboutAuthor;
  private String directory;
  private String media;
  private Category category;
}
