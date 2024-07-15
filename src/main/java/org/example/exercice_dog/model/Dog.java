package org.example.exercice_dog.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder

public class Dog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    @Column(name="dog_id")
    private int id;
    private String name;
    private String breed;
    private LocalDate dateOfBirth;

    public Dog(String name, String breed, LocalDate dateOfBirth) {
        this.name = name;
        this.breed = breed;
        this.dateOfBirth = dateOfBirth;
    }
}
