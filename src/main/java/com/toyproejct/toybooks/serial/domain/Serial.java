package com.toyproejct.toybooks.serial.domain;

import com.toyproejct.toybooks.author.domain.Author;
import lombok.Getter;
import lombok.ToString;
import org.hibernate.annotations.Fetch;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Entity
@ToString
@Table(name = "serial")
public class Serial {

    @Id
    @Column(name = "serial_no")
    private Integer no;

    @Column(name = "serial_content")
    private String content;

    @Column(name = "serial_register_date")
    private LocalDateTime registerDate;

    @Column(name = "serial_count")
    private Integer count;

    @Column(name = "serial_state")
    private String state;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private Author author;
}
