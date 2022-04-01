package com.toyproejct.toybooks.grade.domain;

import lombok.Getter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@ToString
@Table(name = "grade")
public class Grade {

    @Id
    @Column(name = "grade_code")
    private String code;

    @Column(name = "grade_name")
    private String name;

    @Column(name = "grade_desc")
    private String desc;

    @Column(name = "grade_order")
    private Integer order;
}
