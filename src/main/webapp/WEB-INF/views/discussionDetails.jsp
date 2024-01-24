<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix= "fmt" uri= "http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isErrorPage="true" %>
  
<!DOCTYPE html>
<html class="dark">
<!-- header -->

<head>
	<meta charset="ISO-8859-1" name="viewport" content="width=device-width initial-scale=1.0">
	<title>NurseBulletin</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/css/main.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>

<body >
<header>
	<nav x-data="{ isOpen: false }" class="relative bg-white shadow shadow-white dark:bg-gray-800">
		<div class="container  px-6 py-4 mx-auto">
			<div class="lg:flex lg:items-center lg:justify-between ">
				<div class="flex items-center justify-between">
					<a class=" px-3 py-2 text-white text-2xl transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" href="/">
						<img class="w-22 h-22 sm:h-8 " src="/assets/nursebulletin-transparent.png" alt="">
					</a>

					<!-- Mobile menu button -->
					<div class="flex lg:hidden">
						<button x-cloak @click="isOpen = !isOpen" type="button" class="text-gray-500 dark:text-gray-200 hover:text-gray-600 dark:hover:text-gray-400 focus:outline-none focus:text-gray-600 dark:focus:text-gray-400" aria-label="toggle menu">
							<svg x-show="!isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
								<path stroke-linecap="round" stroke-linejoin="round" d="M4 8h16M4 16h16" />
							</svg>

							<svg x-show="isOpen" xmlns="http://www.w3.org/2000/svg" class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
								<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
							</svg>
						</button>
					</div>
				</div>

				<!-- Mobile Menu open: "block", Menu closed: "hidden" -->

				<c:choose>
					<c:when test="${not empty sessionScope.userId}">
						<c:choose>
							<c:when test="${not empty user.profilePicture and fn:length(user.profilePicture) != 2 }">
								<!-- large screens -->
								<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
									<div class="flex items-center mt-4 lg:mt-0">
										<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8 lg:relative">
											<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
											<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
											<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
											<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
											<div x-data="{ isOpen: false }" class="relative inline-block">
												<!-- Dropdown toggle button -->
												<button @click="isOpen = !isOpen" class="ml-3 relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
													<span class="mx-1"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
													<svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path d="M12 15.713L18.01 9.70299L16.597 8.28799L12 12.888L7.40399 8.28799L5.98999 9.70199L12 15.713Z" fill="currentColor"></path>
													</svg>
												</button>

												<!-- Dropdown menu -->
												<div x-show="isOpen"
													 @click.away="isOpen = false"
													 x-transition:enter="transition ease-out duration-100"
													 x-transition:enter-start="opacity-0 scale-90"
													 x-transition:enter-end="opacity-100 scale-100"
													 x-transition:leave="transition ease-in duration-100"
													 x-transition:leave-start="opacity-100 scale-100"
													 x-transition:leave-end="opacity-0 scale-90"
													 class="absolute z-20 w-56 py-2 mt-2 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800 sm:left-0 md:left-0 lg:left-auto lg:right-0 xl:right-0 2xl:right-0"
												>
													<a href="/dashboard" class="flex items-center p-3 -mt-2 text-sm text-gray-600 transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														<span class="mx-3"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
														<div class="mx-1">
															<h1 class="text-sm font-semibold text-gray-700 dark:text-gray-200"> <c:out value="${ user.firstName } ${ user.lastName }"></c:out> </h1>
															<p class="text-sm text-gray-500 dark:text-gray-400"> <c:out value="${user.email}"></c:out> </p>
														</div>
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/dashboard" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Dashboard
													</a>
													<a href="/discussion/allDiscussions" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Forums
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/review/new" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Add review
													</a>
													<a href="/user/edit/<c:out value="${user.id}"></c:out> " class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Edit profile
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/user/logout" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Sign Out
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
									<div class="flex items-center mt-4 lg:mt-0 lg:relative">
										<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8 lg:relative">
											<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
											<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
											<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
											<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
											<div x-data="{ isOpen: false }" class="relative inline-block ">
												<!-- Dropdown toggle button -->
												<button @click="isOpen = !isOpen" class="ml-3 relative z-10 flex items-center p-2 text-sm text-gray-600 bg-white border border-transparent rounded-md focus:border-blue-500 focus:ring-opacity-40 dark:focus:ring-opacity-40 focus:ring-blue-300 dark:focus:ring-blue-400 focus:ring dark:text-white dark:bg-gray-800 focus:outline-none">
																<span class="mx-1">
																	<c:out value="${ fn:substring(sessionScope.cappedFirstNameUser.firstName, 0, 1).toUpperCase() }${ fn:substring(sessionScope.cappedFirstNameUser.lastName, 0,1).toUpperCase()}"></c:out>
																</span>
													<svg class="w-5 h-5 mx-1" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
														<path d="M12 15.713L18.01 9.70299L16.597 8.28799L12 12.888L7.40399 8.28799L5.98999 9.70199L12 15.713Z" fill="currentColor"></path>
													</svg>
												</button>

												<!-- Dropdown menu -->
												<div x-show="isOpen"
													 @click.away="isOpen = false"
													 x-transition:enter="transition ease-out duration-100"
													 x-transition:enter-start="opacity-0 scale-90"
													 x-transition:enter-end="opacity-100 scale-100"
													 x-transition:leave="transition ease-in duration-100"
													 x-transition:leave-start="opacity-100 scale-100"
													 x-transition:leave-end="opacity-0 scale-90"
													 class="absolute z-20 w-56 py-2 mt-2 overflow-hidden origin-top-right bg-white rounded-md shadow-xl dark:bg-gray-800 sm:left-0 md:left-0 lg:left-auto lg:right-0 xl:right-0 2xl:right-0"
												>
													<a href="/dashboard" class="flex items-center p-3 -mt-2 text-sm text-gray-600 transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														<c:if test="${fn:length(user.profilePicture) == 2 || empty user.profilePicture}">
															<p>
																<c:out value="${ fn:substring(sessionScope.cappedFirstNameUser.firstName, 0, 1).toUpperCase() }${ fn:substring(sessionScope.cappedFirstNameUser.lastName, 0,1).toUpperCase()}"></c:out>
															</p>
														</c:if>
														<span class="mx-3"> <i class="fa-solid  <c:out value="${ user.profilePicture }"></c:out>"></i>  </span>
														<div class="mx-1">
															<h1 class="text-sm font-semibold text-gray-700 dark:text-gray-200"> <c:out value="${ user.firstName } ${ user.lastName }"></c:out> </h1>
															<p class="text-sm text-gray-500 dark:text-gray-400"> <c:out value="${user.email}"></c:out> </p>
														</div>
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/dashboard" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Dashboard
													</a>
													<a href="/discussion/allDiscussions" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Forums
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/review/new" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Add review
													</a>
													<a href="/user/edit/<c:out value="${user.id}"></c:out> " class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Edit profile
													</a>
													<hr class="border-gray-200 dark:border-gray-700 ">
													<a href="/user/logout" class="block px-4 py-3 text-sm text-gray-600 capitalize transition-colors duration-300 transform dark:text-gray-300 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-white">
														Sign Out
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<div x-cloak :class="[isOpen ? 'translate-x-0 opacity-100 ' : 'opacity-0 -translate-x-full']" class="absolute inset-x-0 z-20 w-full px-6 py-4 transition-all duration-300 ease-in-out bg-white dark:bg-gray-800 lg:mt-0 lg:p-0 lg:top-0 lg:relative lg:bg-transparent lg:w-auto lg:opacity-100 lg:translate-x-0 lg:flex lg:items-center">
							<div class="flex items-center mt-4 lg:mt-0 lg:relative">
								<div class="flex flex-col -mx-6 lg:flex-row lg:items-center lg:mx-8">
									<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Home</a>
									<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Reviews</a>
									<a href="/hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Hospitals</a>
									<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700">Forums</a>
									<div class="flex items-center gap-2 mx-6 my-2">
										<a id="bg-color-login" class="px-6 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80" href="/user/login" >Log in</a>
										<a class="px-6 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-300 transform bg-blue-600 rounded-lg hover:bg-blue-500 focus:outline-none focus:ring focus:ring-blue-300 focus:ring-opacity-80"  href="/user/register" >Join NurseBulletin</a>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		</div>
		</div>
	</nav>
</header>
		<main>
			<div x-data="{ showDeleteModal: false, deleteCommentId: null }"
				 @delete-comment.window="showDeleteModal = true; deleteCommentId = $event.detail.commentId;"
				 class="fixed inset-0 z-10 overflow-y-auto"
				 aria-labelledby="modal-title"
				 role="dialog"
				 aria-modal="true"
				 x-show="showDeleteModal">

				<!-- Modal backdrop -->
				<div class="flex items-end justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
					<div class="fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity" aria-hidden="true"></div>

					<!-- Modal panel -->
					<div class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
						<div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
							<div class="sm:flex sm:items-start">
								<div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
									<h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-title">
										Are you sure you want to delete this comment?
									</h3>
								</div>
							</div>
						</div>
						<div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
							<button type="button" class="w-full inline-flex justify-center rounded-md border border-transparent shadow-sm px-4 py-2 bg-red-600 text-base font-medium text-white hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 sm:ml-3 sm:w-auto sm:text-sm"
									@click="showDeleteModal = false; $dispatch('confirm-delete', { commentId: deleteCommentId })">
								Delete
							</button>
							<button type="button" class="mt-3 w-full inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-base font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:w-auto sm:text-sm"
									@click="showDeleteModal = false">
								Cancel
							</button>
						</div>
					</div>
				</div>
			</div>
			<section class="bg-white dark:bg-gray-900 pt-12">
				<article class="max-w-2xl px-6 pt-24 py-8 mx-auto space-y-12 dark:bg-gray-800 dark:text-gray-50 rounded-md">
					<div class="w-full mx-auto space-y-4 text-center">
						<p class="text-md font-semibold tracki uppercase text-violet-400">
							<c:out value="${discussion.category.name}"></c:out>
						</p>
						<h1 class="text-4xl font-bold leadi md:text-5xl">
							<q>
								<c:out value="${discussion.title}"></c:out>
							</q>
						</h1>
						<p class="text-md dark:text-gray-400">
							by @<span class="text-violet-400"><c:out value="${discussion.author.username}"></c:out> </span> on
							<c:out value="${discussionDateMap[discussion.getId()]}"></c:out>
						</p>
					</div>
					<div class="dark:text-gray-100">
						<p>
							<c:out value="${discussion.description}"></c:out>
						</p>
					</div>

					<div class="pt-12 border-t dark:border-gray-700 ">
						<c:choose>
							<c:when test="${empty comments}">
								<p class="dark:text-gray-400 text-center">Currently there are no comments on this thread, feel free to add some input.</p>
							</c:when>
							<c:otherwise>
								<c:forEach var="comment" items="${comments}">
									<!-- this is the comment div -->
									<div class="flex flex-col space-y-4 md:space-y-0 md:space-x-6 md:flex-row ">
										<div class="flex flex-col">
											<h4 class="text-lg font-semibold text-violet-400">

												<c:out value="${comment.author.username}"></c:out>
											</h4>
											<p class="dark:text-gray-400">
												<c:out value="${comment.content}"></c:out>
											</p>
										</div>
									</div>
									<div class="block md:flex justify-between py-4 items-center border-b border-b-gray-500">
										<c:choose>
											<c:when test="${not empty sessionScope.userId and comment.author.id == sessionScope.userId}">
												<c:choose>
													<c:when test="${not empty comment.updatedAt}">
														<span class="rounded-md dark:text-gray-100">
															<span class="text-white">Updated </span><c:out value="${comment.fortmattedDate} - ${comment.formattedCommentTime}"></c:out>
														</span>
													</c:when>
													<c:otherwise>
														<span class="rounded-md dark:text-gray-100">
															<span class="text-white">Posted </span><c:out value="${comment.fortmattedDate} - ${comment.formattedCommentTime}"></c:out>
														</span>
													</c:otherwise>
												</c:choose>
												<div class="block md:flex items-center center-container">
													<a type="button" class="block md:mx-2 lg:mx-2 my-2 py-2 md:py-2 md:px-2 px-4 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300" href="/discussion/${ discussion.id }/comment/edit/${ comment.id }" >Edit comment</a>
													<a type="button" class="block py-2 px-4 md:py-2 md:px-2 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300" href="javascript:void(0);" @click="console.log('Delete clicked, dispatching event', ${comment.id}); $dispatch('delete-comment', { commentId: ${comment.id} })">Delete comment</a>
												</div>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${not empty comment.updatedAt}">
													<span class="rounded-md dark:text-gray-100">
														<span class="text-white">Updated </span><c:out value="${comment.fortmattedDate} - ${comment.formattedCommentTime}"></c:out>
													</span>
													</c:when>
													<c:otherwise>
														<span class="rounded-md dark:text-gray-100">
															<span class="text-white">Posted </span><c:out value="${comment.fortmattedDate} - ${comment.formattedCommentTime}"></c:out>
														</span>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="text-center flex justify-center mt-6">
							<a type="button" class="block md:w-1/2 py-2 px-4 md:py-2 md:px-2 font-semibold rounded dark:dark:bg-violet-400 dark:dark:text-gray-900 duration-300 hover:bg-violet-300"  href="/discussion/newComment?discussionId=${ discussionId }">Comment</a>
						</div>
					</div>
				</article>
			</section>
		</main>

	<!-- footer -->

	<!-- ========== END MAIN CONTENT ========== -->
	<script src="${pageContext.request.contextPath}../node_modules/preline/dist/preline.js"></script>
	<script src="/js/script.js"></script>
	<script src="https://kit.fontawesome.com/eb2c2d28d2.js" crossorigin="anonymous"></script>
	<footer class="bg-white dark:bg-gray-900">
		<div class="container px-6 py-8 mx-auto">
			<div class="flex flex-col items-center text-center">
				<a href="#">
					<h2 class=" px-3 py-2 text-white text-2xl transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" href="/" >
						<img class="w-22 h-22 sm:h-8 " src="/assets/nursebulletin-transparent.png" alt="">
					</h2>
				</a>

				<div class="flex flex-wrap justify-center mt-6 -mx-4">
					<a href="/" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Home </a>

					<a href="/review/allReviews" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Reviews </a>

					<a href="hospitals/allHospitals" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Hospitals </a>

					<a href="/discussion/allDiscussions" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Forums </a>

					<a href="#" class="px-3 py-2 mx-3 mt-2 text-gray-700 transition-colors duration-300 transform rounded-md lg:mt-0 dark:text-gray-200 hover:bg-gray-100 dark:hover:bg-gray-700" aria-label="Reddit"> Terms of use </a>
				</div>

			</div>

			<hr class="my-6 border-gray-200 md:my-10 dark:border-gray-700" />

			<div class="flex flex-col items-center sm:flex-row sm:justify-between">
				<p class="text-sm text-gray-500 dark:text-gray-300 ">© Copyright 2024. All Rights Reserved.</p>

				<div class="flex -mx-2 sm:my-4">
					<a href="https://www.tiktok.com/@itsthejourneylak" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Tiktok">
						<svg fill="none" class="w-9 h-9 fill-current" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" xml:space="preserve"><path d="M19.589 6.686a4.793 4.793 0 0 1-3.77-4.245V2h-3.445v13.672a2.896 2.896 0 0 1-5.201 1.743l-.002-.001.002.001a2.895 2.895 0 0 1 3.183-4.51v-3.5a6.329 6.329 0 0 0-5.394 10.692 6.33 6.33 0 0 0 10.857-4.424V8.687a8.182 8.182 0 0 0 4.773 1.526V6.79a4.831 4.831 0 0 1-1.003-.104z"/></svg>
					</a>

					<a href="https://www.linkedin.com/in/laz-alvarez/" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Linkedin">
						<i class="fa-brands fa-linkedin-in text-4xl  fill-current"></i>
					</a>

					<a href="https://github.com/thisislaz" class="mx-2 text-gray-600 transition-colors duration-300 dark:text-gray-300 hover:text-blue-500 dark:hover:text-blue-400" aria-label="Github">
						<svg class="w-9 h-9 fill-current" viewBox="0 0 24 24" fill="none"
							 xmlns="http://www.w3.org/2000/svg">
							<path
									d="M12.026 2C7.13295 1.99937 2.96183 5.54799 2.17842 10.3779C1.395 15.2079 4.23061 19.893 8.87302 21.439C9.37302 21.529 9.55202 21.222 9.55202 20.958C9.55202 20.721 9.54402 20.093 9.54102 19.258C6.76602 19.858 6.18002 17.92 6.18002 17.92C5.99733 17.317 5.60459 16.7993 5.07302 16.461C4.17302 15.842 5.14202 15.856 5.14202 15.856C5.78269 15.9438 6.34657 16.3235 6.66902 16.884C6.94195 17.3803 7.40177 17.747 7.94632 17.9026C8.49087 18.0583 9.07503 17.99 9.56902 17.713C9.61544 17.207 9.84055 16.7341 10.204 16.379C7.99002 16.128 5.66202 15.272 5.66202 11.449C5.64973 10.4602 6.01691 9.5043 6.68802 8.778C6.38437 7.91731 6.42013 6.97325 6.78802 6.138C6.78802 6.138 7.62502 5.869 9.53002 7.159C11.1639 6.71101 12.8882 6.71101 14.522 7.159C16.428 5.868 17.264 6.138 17.264 6.138C17.6336 6.97286 17.6694 7.91757 17.364 8.778C18.0376 9.50423 18.4045 10.4626 18.388 11.453C18.388 15.286 16.058 16.128 13.836 16.375C14.3153 16.8651 14.5612 17.5373 14.511 18.221C14.511 19.555 14.499 20.631 14.499 20.958C14.499 21.225 14.677 21.535 15.186 21.437C19.8265 19.8884 22.6591 15.203 21.874 10.3743C21.089 5.54565 16.9181 1.99888 12.026 2Z">
							</path>
						</svg>
					</a>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>