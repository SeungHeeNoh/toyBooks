package com.toyproejct.toybooks.authority.domain;

import lombok.Getter;
import lombok.ToString;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Getter
@Entity
@ToString
@Table(name = "authority")
public class Authority {

    @Id
    @Column(name = "authority_code")
    private String code;

    @Column(name = "authority_name")
    private String name;

    @Column(name = "authority_order")
    private Integer order;
}
