package com.toyproejct.toybooks.genre.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@ToString
@Table(name = "genre")
public class Genre {

    @Id
    @Column(name = "genre_no")
    private Integer no;

    @Column(name = "genre_name")
    private String name;

    @Column(name = "genre_desc")
    private String desc;
}
