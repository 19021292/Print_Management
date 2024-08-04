using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PM.Application.ImplementService;
using PM.Application.InterfaceService;
using PM.Application.Payloads.RequestModels.ShippingRequests;

namespace Print_Management.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShippingController : ControllerBase
    {
        private readonly IProjectService _projectService;
        private readonly IDesignService _designService;
        private readonly IPrintJobService _printJobService;
        private readonly IResourceManagementService _resourceManagementService;
        private readonly IShippingService _shippingService;

        public ShippingController(IProjectService projectService, IDesignService designService, IPrintJobService printJobService
            , IResourceManagementService resourceManagementService, IShippingService shippingService)
        {
            _projectService = projectService;
            _designService = designService;
            _printJobService = printJobService;
            _resourceManagementService = resourceManagementService;
            _shippingService = shippingService;
        }

        [HttpPost("Create delivery")]
        [Authorize]
        public async Task<IActionResult> CreateDeliveryAsync([FromBody] Request_CreateDelivery request)
        {
            var response = await _shippingService.CreateDeliveryAsync(request);

            if (response.Status == StatusCodes.Status201Created)
            {
                return Ok(response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }

        [HttpPost("Update delivery-status")]
        [Authorize]
        public async Task<IActionResult> DeliveryStatusUpdate(long deliveryId)
        {
            var response = await _shippingService.DeliveryStatusUpdate(deliveryId);

            if (response.Status == StatusCodes.Status201Created)
            {
                return Ok(response.Data);
            }

            return StatusCode(response.Status, response.Message);
        }
    }
}
