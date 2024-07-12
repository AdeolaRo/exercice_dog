package org.example.exercice_dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.exercice_dog.model.Dog;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "dogservlet", value = "/dog/*")
public class DogServlet extends HttpServlet {

    private List<Dog> dogs;

    @Override
    public void init() throws ServletException {
        dogs = new ArrayList<>();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Dog> dogs = new ArrayList<>();

        String pathInfo = req.getPathInfo();
        switch (pathInfo) {
            case "/list":
                req.setAttribute("dogs", dogs);
                req.getRequestDispatcher("/WEB-INF/list.jsp").forward(req, resp);
                break;
            case "/add":
                req.getRequestDispatcher("/WEB-INF/form.jsp").forward(req, resp);
                break;
            case "/detail":
                req.getRequestDispatcher("/WEB-INF/detail.jsp").forward(req, resp);
                break;
        }


        req.getRequestDispatcher("/WEB-INF/detail.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        LocalDate dateOfBirth = LocalDate.parse(req.getParameter("dateOfBirth"));

        // creation du chien
        Dog dog = new Dog(name, breed, dateOfBirth);
        dogs.add(dog);

        doGet(req, resp);
    }
}
