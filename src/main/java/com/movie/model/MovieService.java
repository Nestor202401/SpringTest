package com.movie.model;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("movieService")
public class MovieService {

    @Autowired
    private MovieRepository repository;

    public void addMovie(MovieVO movie) {
        repository.save(movie);
    }

    public void updateMovie(MovieVO movie) {
        repository.save(movie);
    }

    public void deleteMovie(Integer movieId) {
        if (repository.existsById(movieId)) {
            repository.deleteById(movieId);
        }
    }

    public MovieVO getOneMovie(Integer movieId) {
        Optional<MovieVO> optional = repository.findById(movieId);
        return optional.orElse(null);
    }

    public List<MovieVO> getAllMovies() {
        return repository.findAll();
    }
}
