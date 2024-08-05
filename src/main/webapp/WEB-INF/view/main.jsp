<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <%@ include file= "/WEB-INF/view/layout/header.jsp" %>
<div class="main--page">
   <!-- 사이드바 -->
    <div class="side--bar">
      <a href="#">Bakara</a><br>
      <a href="#">Poker</a><br>
      <a href="#">FlowerWar</a><br>

    </div>
    <!-- 내용 -->
    <div class="content">
        <div class="room--list">
            <p>room list</p>
        </div>
        <div class="main--content" id="roomContainer">
          
        </div>
        <div class="pagination" id="pagination">
        
        </div>
    </div>
</div>
<script>
    const roomsPerPage = 10;
    let currentPage = 1;
    const totalRooms = 30; 

    function renderRooms(page) {
        const roomContainer = document.getElementById('roomContainer');
        roomContainer.innerHTML = '';

        const start = (page - 1) * roomsPerPage;
        const end = Math.min(start + roomsPerPage, totalRooms);

        for (let i = start; i < end; i++) {
            const room = document.createElement('div');
            room.className = 'room';
            room.innerHTML = `
                <div class="room--img"></div>
                <a href="#">room${i + 1}</a>
                <a> Start bet:50 point </a>
                <div class="game-time">게임 시간: ${Math.floor(Math.random() * 60)}분</div>
            `;
            roomContainer.appendChild(room);
        }
    }

    function renderPagination() {
        const pagination = document.getElementById('pagination');
        pagination.innerHTML = '';

        const totalPages = Math.ceil(totalRooms / roomsPerPage);

        for (let i = 1; i <= totalPages; i++) {
            const pageLink = document.createElement('a');
            pageLink.href = '#';
            pageLink.textContent = i;
            pageLink.className = i === currentPage ? 'active' : '';
            pageLink.addEventListener('click', (e) => {
                e.preventDefault();
                currentPage = i;
                renderRooms(currentPage);
                renderPagination();
            });
            pagination.appendChild(pageLink);
        }
    }

    document.addEventListener('DOMContentLoaded', () => {
        renderRooms(currentPage);
        renderPagination();
    });
    </script>
    
   <%@ include file= "/WEB-INF/view/layout/footer.jsp" %>
