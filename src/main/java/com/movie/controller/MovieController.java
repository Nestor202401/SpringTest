package com.movie.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.movie.model.MovieService;
import com.movie.model.MovieVO;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    MovieService movieSvc;

    /*
     * This method will serve as addMovie.html handler.
     */
    @GetMapping("addMovie")
    public String addMovie(ModelMap model) {
        MovieVO movieVO = new MovieVO();
        model.addAttribute("movieVO", movieVO);
        return "back-end/movie/addMovie";
    }

    /*
     * This method will be called on addMovie.html form submission, handling POST request
     * It also validates the user input
     */
    @PostMapping("insert")
    public String insert(@Valid MovieVO movieVO, BindingResult result, ModelMap model) {

        /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ************************/
        if (result.hasErrors()) {
            return "back-end/movie/addMovie";
        }

        /*************************** 2.開始新增資料 *****************************************/
        movieSvc.addMovie(movieVO);

        /*************************** 3.新增完成,準備轉交(Send the Success view) **************/
        List<MovieVO> list = movieSvc.getAllMovies();
        model.addAttribute("movieListData", list);
        model.addAttribute("success", "- (新增成功)");
        return "redirect:/movie/listAllMovies"; // 新增成功後重導至listAllMovies
    }

    /*
     * This method will be called on listAllMovies.html form submission, handling POST request
     */
    @PostMapping("getOne_For_Update")
    public String getOne_For_Update(@RequestParam("movieId") String movieId, ModelMap model) {
        /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ************************/
        /*************************** 2.開始查詢資料 *****************************************/
        MovieVO movieVO = movieSvc.getOneMovie(Integer.valueOf(movieId));

        /*************************** 3.查詢完成,準備轉交(Send the Success view) **************/
        model.addAttribute("movieVO", movieVO);
        return "back-end/movie/update_movie_input"; // 查詢完成後轉交update_movie_input.html
    }

    /*
     * This method will be called on update_movie_input.html form submission, handling POST request
     * It also validates the user input
     */
    @PostMapping("update")
    public String update(@Valid MovieVO movieVO, BindingResult result, ModelMap model) {

        /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ************************/
        if (result.hasErrors()) {
            return "back-end/movie/update_movie_input";
        }

        /*************************** 2.開始修改資料 *****************************************/
        movieSvc.updateMovie(movieVO);

        /*************************** 3.修改完成,準備轉交(Send the Success view) **************/
        model.addAttribute("success", "- (修改成功)");
        movieVO = movieSvc.getOneMovie(Integer.valueOf(movieVO.getMovieId()));
        model.addAttribute("movieVO", movieVO);
        return "redirect:/movie/listAllMovies"; // 修改成功後轉交listOneMovie.html
    }

    /*
     * This method will be called on listAllMovies.html form submission, handling POST request
     */
    @PostMapping("delete")
    public String delete(@RequestParam("movieId") String movieId, ModelMap model) {
        /*************************** 1.接收請求參數 - 輸入格式的錯誤處理 ************************/
        /*************************** 2.開始刪除資料 *****************************************/
        movieSvc.deleteMovie(Integer.valueOf(movieId));
        /*************************** 3.刪除完成,準備轉交(Send the Success view) **************/
        List<MovieVO> list = movieSvc.getAllMovies();
        model.addAttribute("movieListData", list);
        model.addAttribute("success", "- (刪除成功)");
        return "back-end/movie/listAllMovies"; // 刪除完成後轉交listAllMovies.html
    }

    /*
     * This method will be called to show all movies.
     */
    @GetMapping("listAllMovies")
    public String listAllMovies(ModelMap model) {
        /*************************** 1.開始查詢資料 *****************************************/
        List<MovieVO> list = movieSvc.getAllMovies();

        /*************************** 2.查詢完成,準備轉交(Send the Success view) **************/
        model.addAttribute("movieListData", list);
        return "back-end/movie/listAllMovies"; 
    }
    
  //Ajax查詢全部使用方法
    
  @GetMapping("listAllMoviesAjax")
  @ResponseBody
  public List<MovieVO> listAllMovies() {
      List<MovieVO> list = movieSvc.getAllMovies();
      return list;
  }

  @GetMapping("listAllMoviesPage")
  public String listAllMoviesPage(ModelMap model) {
      List<MovieVO> list = movieSvc.getAllMovies();
      model.addAttribute("movieListData", list);
      return "back-end/movie/listAllMoviesAjax";
  }
}
