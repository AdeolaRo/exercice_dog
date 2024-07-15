package org.example.exercice_dog.dao;

import org.example.exercice_dog.model.Dog;
import org.example.exercice_dog.util.SessionfactorySingleton;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.util.List;

public class DogDAO {

    private SessionFactory sessionFactory;
    private Session session;


    public void create(Dog dog) {

        Transaction transaction = null;
        session = SessionfactorySingleton.getSessionFactory().openSession();

        try {
            transaction = session.beginTransaction();
            session.save(dog);
            transaction.commit();
        } catch (Exception e) {
//            if (transaction != null) {
//                transaction.rollback();
            }

    }

    public List<Dog> allDogs() {
        session = SessionfactorySingleton.getSessionFactory().openSession();
        return session.createQuery("from Dog", Dog.class).list();
    }

    public Dog findDogById(int id) {
       session = SessionfactorySingleton.getSessionFactory().openSession();
       return session.get(Dog.class, id);
    }
}
