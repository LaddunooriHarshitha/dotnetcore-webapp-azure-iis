using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.Extensions.Logging;
using Moq;
using System.Threading.Tasks;
using Xunit;

namespace DotNetCoreWebApp.Tests
{
    public class HomeControllerTests
    {
        private readonly HomeController _controller;
        private readonly Mock<ILogger<HomeController>> _logger;

        public HomeControllerTests()
        {
            _logger = new Mock<ILogger<HomeController>>();
            _controller = new HomeController(_logger.Object);
        }

        [Fact]
        public async Task Index_ReturnsViewResult_WithExpectedViewName()
        {
            // Act
            var result = await _controller.Index();

            // Assert
            var viewResult = Assert.IsType<ViewResult>(result);
            Assert.Equal("Index", viewResult.ViewName);
        }

        [Fact]
        public async Task Privacy_ReturnsViewResult()
        {
            // Act
            var result = await _controller.Privacy();

            // Assert
            Assert.IsType<ViewResult>(result);
        }
    }
}