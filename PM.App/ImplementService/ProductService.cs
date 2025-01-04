using Microsoft.AspNetCore.Http;
using PM.Application.Payloads.RequestModels.ProjectRequests;
using PM.Application.Payloads.ResponseModels.DataProjects;
using PM.Application.Payloads.Responses;
using PM.Domain.Entities;
using PM.Domain.InterfaceRepositories;

public class ProductService : IProductService
{
    private readonly IBaseRepository<Product> _productRepository;

    public ProductService(IBaseRepository<Product> productRepository)
    {
        _productRepository = productRepository;
    }

    public async Task<ResponseObject<DataResponseProduct>> CreateProductAsync(Request_CreateProduct request)
    {
        var product = new Product
        {
            Name = request.Name,
            Description = request.Description,
            Price = request.Price,
            ImageUrl = request.ImageUrl,
            CreatedAt = DateTime.Now,
        };

        var createdProduct = await _productRepository.CreateAsync(product);

        var response = new DataResponseProduct
        {
            Id = createdProduct.Id,
            Name = createdProduct.Name,
            Description = createdProduct.Description,
            Price = createdProduct.Price,
            ImageUrl = createdProduct.ImageUrl,
            CreatedAt = createdProduct.CreatedAt,
            UpdatedAt = createdProduct.UpdatedAt ?? DateTime.MinValue
        };

        return new ResponseObject<DataResponseProduct> { Data = response, Message = "Product created successfully"};
    }

    public async Task<ResponseObject<List<DataResponseProduct>>> GetAllProductsAsync()
    {
        try
        {
            var products = await _productRepository.GetAllAsync();

            if (products == null || !products.Any())
            {
                return new ResponseObject<List<DataResponseProduct>>
                {
                    Status = StatusCodes.Status404NotFound,
                    Message = "No products found.",
                    Data = null
                };
            }

            var responseData = products.Select(p => new DataResponseProduct
            {
                Id = p.Id,
                Name = p.Name,
                Description = p.Description,
                Price = p.Price,
                ImageUrl = p.ImageUrl,
                CreatedAt = p.CreatedAt,
                UpdatedAt = p.UpdatedAt ?? (DateTime?)null // Correctly assign nullable datetime
            }).ToList();

            return new ResponseObject<List<DataResponseProduct>>
            {
                Status = StatusCodes.Status200OK,
                Message = "Products fetched successfully.",
                Data = responseData
            };
        }
        catch (Exception ex)
        {
            return new ResponseObject<List<DataResponseProduct>>
            {
                Status = StatusCodes.Status500InternalServerError,
                Message = ex.Message,
                Data = null
            };
        }
    }



    public async Task<ResponseObject<DataResponseProduct>> GetProductByIdAsync(long id)
    {
        try
        {
            var product = await _productRepository.GetByIdAsync(id);
            if (product == null)
            {
                return new ResponseObject<DataResponseProduct>
                {
                    Status = StatusCodes.Status404NotFound,
                    Message = "Product not found.",
                    Data = null
                };
            }

            var response = new DataResponseProduct
            {
                Id = product.Id,
                Name = product.Name,
                Description = product.Description,
                Price = product.Price,
                ImageUrl = product.ImageUrl,
                CreatedAt = product.CreatedAt,
                UpdatedAt = product.UpdatedAt ?? DateTime.MinValue
            };

            return new ResponseObject<DataResponseProduct>
            {
                Status = StatusCodes.Status200OK,
                Message = "Product retrieved successfully.",
                Data = response
            };
        }
        catch (Exception ex)
        {
            return new ResponseObject<DataResponseProduct>
            {
                Status = StatusCodes.Status500InternalServerError,
                Message = ex.Message,
                Data = null
            };
        }
    }
}
