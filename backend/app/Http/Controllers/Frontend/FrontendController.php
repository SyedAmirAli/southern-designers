<?php

namespace App\Http\Controllers\Frontend;

use App\Helper\SinglePageDataKeyManager;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Media;
use App\Models\MediaGallery;
use App\Models\Member;
use App\Models\OthersService;
use App\Models\PrimaryService;
use App\Models\Product;
use App\Models\Review;
use App\Models\ServicesCounter;
use App\Models\ServicesProduct;
use App\Models\SinglePageData;
use App\Models\SustainabilityVideo;
use Illuminate\Http\Request;

class FrontendController extends Controller
{
    public function homepageItems()
    {
        $homepage = SinglePageData::where('enum', SinglePageDataKeyManager::HOME_PAGE)->latest('id')->first();
        $utilities = [];
        if ($homepage->contents) $utilities = json_decode($homepage->contents, true);

        $servicesProducts = ServicesProduct::where('status', true)->oldest('serial')->get();
        $primaryServices = PrimaryService::where('status', true)->oldest('serial')->get();
        $othersServices = OthersService::where('status', true)->oldest('serial')->get();
        $reviews = Review::where('status', true)->oldest('serial')->get();
        $brands = Brand::where('status', true)->oldest('serial')->get();
        $featuredProducts = Product::where(['status' => true, 'featured' => 'showcase'])->oldest('serial')->get();

        $servicesCounters = array_map(function ($service) {
            return [...$service, 'value' => number_format($service['value'])];
        }, ServicesCounter::where('status', true)->oldest('serial')->get()->toArray());

        return response()->json(compact('utilities', 'servicesProducts', 'primaryServices', 'servicesCounters', 'othersServices', 'reviews', 'brands', 'featuredProducts'));
    }

    public function aboutItems()
    {
        $homepage = SinglePageData::where('enum', SinglePageDataKeyManager::ABOUT_PAGE)->latest('id')->first();
        $utilities = [];

        if ($homepage->contents) $utilities = json_decode($homepage->contents, true);
        $members = Member::where('status', true)->oldest('serial')->get();

        return response()->json(compact('members', 'utilities'));
    }

    public function categories()
    {
        $categories = Category::where('status', true)->latest('id')->get();
        return response()->json($categories);
    }

    public function categoryWithProducts(string $slug)
    {
        $category = Category::where(['status' => true, 'slug' => $slug])->latest('id')->first();
        $paginateProducts = $category->paginateProducts();

        return response()->json(compact('category', 'paginateProducts'));
    }

    public function mediaItems()
    {
        $media = SinglePageData::where('enum', SinglePageDataKeyManager::MEDIA_PAGE)->latest('id')->first();
        $utilities = [];

        if ($media->contents) $utilities = json_decode($media->contents, true);
        $medias = Media::where('status', true)->oldest('serial')->get();
        $videos = MediaGallery::where('status', true)->oldest('serial')->get();

        return response()->json(compact('videos', 'utilities', 'medias'));
    }

    public function sustainabilityItems()
    {
        $sustainability = SinglePageData::where('enum', SinglePageDataKeyManager::SUSTAINABILITY_PAGE)->latest('id')->first();
        $utilities = [];

        if ($sustainability->contents) $utilities = json_decode($sustainability->contents, true);
        // $medias = Media::where('status', true)->oldest('serial')->get();
        $videos = SustainabilityVideo::where('status', true)->oldest('serial')->get();

        return response()->json(compact('videos', 'utilities'));
    }

    public function contactItems()
    {
        $contact = SinglePageData::where('enum', SinglePageDataKeyManager::CONTACT_PAGE)->latest('id')->first();
        $utilities = [];

        if ($contact->contents) $utilities = json_decode($contact->contents, true);
        // $medias = Media::where('status', true)->oldest('serial')->get();
        // $videos = SustainabilityVideo::where('status', true)->oldest('serial')->get();

        return response()->json(compact('utilities'));
    }

    public function settings()
    {
        $utilities = [];
        $settings = SinglePageData::where('enum', SinglePageDataKeyManager::APP_SETTINGS)->latest('id')->first();
        if ($settings->contents) $utilities = json_decode($settings->contents, true);

        return response()->json(compact('utilities'));
    }
}
