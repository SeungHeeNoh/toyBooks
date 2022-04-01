package com.toyproejct.toybooks.author.domain;

import com.toyproejct.toybooks.genre.domain.Genre;
import com.toyproejct.toybooks.grade.domain.Grade;
import lombok.Getter;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Entity
@ToString
@Table(name = "author")
public class Author {

    @Id
    @Column(name = "author_id")
    private String id;

    @Column(name = "author_password")
    private String password;

    @Column(name = "author_name")
    private String name;

    @Column(name = "grade_update_date")
    private LocalDateTime gradeUpdateDate;

    @Column(name = "author_lastest_login_date")
    private LocalDateTime lastestLoginDate;

    @Column(name = "author_state")
    private String state;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "grade_code")
    private Grade grade;

    @OneToOne
    @JoinColumn(name = "genre_no")
    private Genre genre;

}