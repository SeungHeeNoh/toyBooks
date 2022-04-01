package com.toyproejct.toybooks.admin.domain;

import com.toyproejct.toybooks.authority.domain.Authority;
import com.toyproejct.toybooks.genre.domain.Genre;
import lombok.Getter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Entity
@ToString
@Table(name = "admin")
public class Admin {

    @Id
    @Column(name = "admin_id")
    private String id;

    @Column(name = "admin_password")
    private String password;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "genre_no")
    private Genre genre;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "authority_code")
    private Authority authority;
}
