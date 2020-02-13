package com.baizhi.es;

import com.baizhi.entity.Book;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.QueryStringQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.SearchResultMapper;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.aggregation.impl.AggregatedPageImpl;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Component;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class Es {
//    @Autowired
//    ElasticsearchTemplate elasticsearchTemplate;
//    public List<Book> showBookByEs(String str){
//        配置高亮器
//        HighlightBuilder.Field nameField = new HighlightBuilder
////                哪些需要配置高亮
//                .Field("*")
////                前缀
//                .preTags("<span style = 'color:red'>")
////                后缀
//                .postTags("</span>")
//                .requireFieldMatch(false);
////搜索条件
//        QueryStringQueryBuilder queryStringQueryBuilder = QueryBuilders.
//                queryStringQuery(str).
//                field("bookName").
//                field("author").
//                analyzer("ik_max_word");
//        //QueryBuilders->多种查询方式的构建工厂   多字段查询
//        NativeSearchQuery nativeSearchQuery = new NativeSearchQueryBuilder()
//                //设置如何查询
//                .withQuery(queryStringQueryBuilder)
//                //设置高亮
//                .withHighlightFields(nameField)
//                .build();
////参数1  查询条件  参数2   返回值类型  参数3 结果集
//        AggregatedPage<Book> books = elasticsearchTemplate.queryForPage(nativeSearchQuery, Book.class, new SearchResultMapper() {
//            @Override
//            public <T> AggregatedPage<T> mapResults(SearchResponse searchResponse, Class<T> aClass, Pageable pageable) {
//                //保存需要返回的数据
//                SearchHit[] hits = searchResponse.getHits().getHits();
//                ArrayList<Book> books = new ArrayList<Book>();
//                for (SearchHit hit : hits) {
//                    //封装对象
//                    Book book = new Book();
//                    //原始map
//                    Map<String, Object> sourceAsMap = hit.getSourceAsMap();
//                    book.setId(sourceAsMap.get("id").toString());
//                    book.setAuthor(sourceAsMap.get("author").toString());
//                    book.setBookName(sourceAsMap.get("bookName").toString());
//                    //高亮替换 ！=null
//                    Map<String, HighlightField> highlightFields = hit.getHighlightFields();
//                    if(highlightFields.get("bookName")!=null){
//                        String bookNameHighlight = highlightFields.get("bookName").getFragments()[0].toString();
//                        book.setBookName(bookNameHighlight);
//                    }
//                    if(highlightFields.get("author")!=null){
//                        String authorHighlight = highlightFields.get("author").getFragments()[0].toString();
//                        book.setAuthor(authorHighlight);
//                    }
//                    books.add(book);
//                }
//                //返回封装结果
//                return new AggregatedPageImpl<T>((List<T>)books);
//            }
//
//            @Override
//            public <T> T mapSearchHit(SearchHit searchHit, Class<T> aClass) {
//                return null;
//            }
//        });
//        return books.getContent();
//    }
}
