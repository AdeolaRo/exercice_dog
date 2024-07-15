package org.example.exercice_dog.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import org.example.exercice_dog.dao.DogDAO;
import org.example.exercice_dog.model.Dog;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "dogservlet", value = "/dog/*")
public class DogServlet extends HttpServlet {

    private DogDAO dogDAO;

    @Override
    public void init() throws ServletException {
        dogDAO = new DogDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ok");

        String pathInfo = req.getPathInfo();

        switch (pathInfo) {
            case "/list":
                showAll(req, resp);
                break;
            case "/add":
                showForm(req, resp);
                break;
            case "/detail":
                showDetail(req, resp);
                break;
            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }


    private void showAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Dog> dogs = dogDAO.allDogs();
        req.setAttribute("dogs", dogs);
        req.getRequestDispatcher("/WEB-INF/list.jsp").forward(req, resp);
    }

    private void showForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/form.jsp").forward(req, resp);
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Dog dog = dogDAO.findDogById(id);
        req.setAttribute("dog", dog);
        req.getRequestDispatcher("/WEB-INF/detail.jsp").forward(req, resp);
    }




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String breed = req.getParameter("breed");
        LocalDate dateOfBirth = LocalDate.parse(req.getParameter("dateOfBirth"));
        Dog dog = new Dog(name, breed, dateOfBirth);
        dogDAO.create(dog);
        resp.sendRedirect(req.getContextPath() + "/dog/list");
    }

}
